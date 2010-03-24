class Order < ActiveRecord::Base
  
  include AASM
  
  belongs_to :user
  belongs_to :shipping, :class_name => "Address"
  belongs_to :billing, :class_name => "Address"
  
  has_one :payment
  has_many :line_items
  
  validates_presence_of :user, :shipping, :billing
  
  accepts_nested_attributes_for :shipping, :billing, :line_items
  
  attr_accessor :billing_and_shipping
  
  aasm_column :status
  aasm_initial_state :pending_payment
  aasm_state :pending_payment
  aasm_state :paid
  aasm_state :sent
  
  aasm_event :pending_payment do
    
  end
  
  aasm_event :paid do
    transitions :to => :paid, :from => :pending_payment
  end
  
  aasm_event :sent do
    transitions :to => :sent, :from => :paid
  end
  
  def name
    shipping.name
  end
  
  def total_items
    line_items.sum(:quantity)
  end
  
  def total_price
    line_items.collect { |l| l.total }.sum
  end
  
  public
  
    def load_cart_items(cart_items)
      cart_items.each do |cart_item|
        line_items.create!(:quantity => cart_item.quantity, :product_id => cart_item.product_id)
      end
    end
end
