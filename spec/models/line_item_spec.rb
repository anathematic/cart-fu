require 'spec_helper'

describe LineItem do
  before(:each) do
    @order = Order.make
    @product = Product.make(:photo => Photo.make)
    
    @valid_attributes = {
      :product_id => @product.id,
      :order_id => @order.id,
      :quantity => 1
    }
    
    @line_item = LineItem.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    LineItem.create!(@valid_attributes)
  end
  
  it "should figure out the price based on the product_id passed (help prevent people from changing prices)" do
    @line_item.save
    @line_item.reload
    @line_item.price.should eql(@product.price)
  end
  
end
