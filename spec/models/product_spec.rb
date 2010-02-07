require 'spec_helper'

describe Product do
  before(:each) do
    @valid_attributes = {
      :name => "Rubber Ball",
      :description => "1 x rubber ball, in great condition and still has its bounce",
      :hot => false,
      :price => 9.99,
    }
    @product = Product.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    @product.build_photo(:photo => File.open("#{RAILS_ROOT}/spec/fixtures/red-ball.jpg"))
    @product.save!
    @product.should be_valid
  end
  
  it "should require an inital photo" do
    @product.save
    @product.should have(1).error_on(:photo)
    @product.build_photo(:photo => File.open("#{RAILS_ROOT}/spec/fixtures/red-ball.jpg"))
    @product.save!
    @product.should be_valid
  end
end
