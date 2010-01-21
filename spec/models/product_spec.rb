require 'spec_helper'

describe Product do
  before(:each) do
    @valid_attributes = {
      :name => "Rubber Ball",
      :description => "1 x rubber ball, in great condition and still has its bounce",
      :hot => false,
      :price => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@valid_attributes)
  end
end
