require 'spec_helper'

describe Address do
  before(:each) do
    @valid_attributes = {
      :name => "Thomas Sinclair",
      :address1 => "624 George Street",
      :address2 => "",
      :suburb => "Sydney",
      :state => "New South Wales",
      :postcode => "2000",
      :phone => "02 9550 3666",
      :country => "Australia"
    }
  end

  it "should create a new instance given valid attributes" do
    Address.create!(@valid_attributes)
  end
end
