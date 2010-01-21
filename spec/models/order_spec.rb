require 'spec_helper'

describe Order do
  before(:each) do
    @user = User.make
    @shipping = Address.make
    @billing = Address.make
    
    @valid_attributes = {
      :user_id => @user.id,
      :shipping_id => @shipping.id,
      :billing_id => @billing.id
    }
    @order = Order.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    @order.should be_valid
    @order.save!
    @order.status.should eql("pending_payment")
  end
  
end
