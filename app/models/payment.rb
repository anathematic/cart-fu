class Payment < ActiveRecord::Base
  
  belongs_to :order
  
  attr_accessor :number, :month, :year, :verification_value, :name
  
  validate :credit_card
  
  def first_name
    order.name.split(" ")[0]
  end
  
  def last_name
    order.name.split(" ")[1]
  end
  
  def credit_card
    credit_card = ActiveMerchant::Billing::CreditCard.new(
      :number => number,
      :month => month,
      :year => year,
      :first_name => first_name,
      :last_name => last_name,
      :verification_value => verification_value	
    )
    
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end
  
end
