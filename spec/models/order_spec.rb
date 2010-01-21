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
    @order.pending_payment?.should eql(true)
  end
  
  it "should be able to correctly calulate the total_items and total_price based on the line_items" do
    @order.save
    
    5.times do 
      @order.line_items.make(:quantity => rand(5))
    end
    
    @order.total_items.should eql(LineItem.sum(:quantity))
    @order.total_price.should eql(LineItem.all.collect { |l| l.price * l.quantity }.sum )
  end
  
end
