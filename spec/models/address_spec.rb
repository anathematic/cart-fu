require 'spec_helper'

describe Address do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :address1 => "value for address1",
      :address2 => "value for address2",
      :suburb => "value for suburb",
      :state => "value for state",
      :postcode => "value for postcode",
      :phone => "value for phone",
      :country => "value for country"
    }
  end

  it "should create a new instance given valid attributes" do
    Address.create!(@valid_attributes)
  end
end
