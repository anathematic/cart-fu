require 'spec_helper'

describe Order do
  before(:each) do
    @valid_attributes = {
      :status => "value for status",
      :user_id => 1,
      :shipping_id => 1,
      :billing_id => 1
    }
    @order = Order.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    @order.should be_valid
    @order.save!
    @order.status.should eql("pending payment")
  end
  
end
