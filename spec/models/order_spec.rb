require 'spec_helper'

describe Order do
  before(:each) do
    @valid_attributes = {
      :status => "value for status",
      :user_id => 1,
      :shipping_id => 1,
      :billing_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Order.create!(@valid_attributes)
  end
end
