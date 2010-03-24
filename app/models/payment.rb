class Payment < ActiveRecord::Base
  
  belongs_to :order
  
  attr_accessor :number, :month, :year, :verification_value, :first_name, :last_name, :card_type
  
  validates_presence_of :order
  validates_associated :order
  
  validate :credit_card
  
  def credit_card
    credit_card = ActiveMerchant::Billing::CreditCard.new(
      :number => number,
      :month => month,
      :year => year,
      :first_name => first_name,
      :last_name => last_name,
      :verification_value => verification_value,
      :type => card_type
    )
    
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end
  
end
