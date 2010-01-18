require 'spec_helper'

describe Cart do
  before(:each) do
    @cart = Cart.new

    5.times do
      Product.make
    end
  end

  it "should be able to add and remove products" do
    @product = Product.first
    @cart.add_product(@product.id)
    @cart.total_items.should eql(1)
    @cart.add_product(@product.id)
    @cart.total_items.should eql(2)

    @product = Product.last
    @cart.add_product(@product.id)
    @cart.add_product(@product.id)
    @cart.add_product(@product.id)
    @cart.products.first.product_id.should eql(Product.first.id)
    @cart.products.first.name.should eql(Product.first.name)
    @cart.total_items.should eql(5)
    
    @cart.remove_product(@product.id)
    @cart.total_items.should eql(2)
  end
  
  it "should be able to update products in bulk" do
    @first_product = Product.all[0]
    @second_product = Product.all[1]
    @third_product = Product.all[2]
    @cart.add_product(@first_product.id)
    @cart.add_product(@second_product.id)
    @cart.add_product(@third_product.id)
    
    @cart.total_items.should eql(3)
    products = [{ "product_id" => 1, "quantity" => 2 }, { "product_id" => 2, "quantity" => 3 }]
    @cart.update_products(products)
    @cart.total_items.should eql(6)
  end
  
end
