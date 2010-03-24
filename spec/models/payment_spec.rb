require 'spec_helper'

describe Payment do
  before(:each) do
    @order = Order.make
    @valid_attributes = {
      :success => false,
      :order => @order,
      :name => @order.name,
      :number => "0000 0000 0000 0000",
      :month => "05",
      :year => "2011",
      :verification_value => "123"
    }
    @payment = Payment.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    Payment.create!(@valid_attributes)
  end
  
  it "should validate that the credit card is validated" do
    @payment.number = nil
    @payment.save
    @payment.should have(1).error
  end
  
end
