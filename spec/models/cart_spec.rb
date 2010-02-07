require 'spec_helper'

describe Cart do
  before(:each) do
    @cart = Cart.new

    5.times do
      Product.make(:photo => Photo.make)
    end
  end

  it "should be able to add and remove products" do
    @product = Product.first
    @cart.add_product(@product.id)
    @cart.total_items.should eql(1)
    @cart.total_price.should eql(@product.price)
    @cart.add_product(@product.id)
    @cart.total_items.should eql(2)
    @cart.total_price.should eql(@product.price*2)
    subtotal = @cart.total_price
    
    @product = Product.last
    @cart.add_product(@product.id)
    @cart.add_product(@product.id)
    @cart.add_product(@product.id)
    @cart.products.first.product_id.should eql(Product.first.id)
    @cart.products.first.name.should eql(Product.first.name)
    @cart.total_items.should eql(5)
    @cart.total_price.should eql((@product.price * 3) + subtotal)
    @cart.remove_product(@product.id)
    @cart.total_items.should eql(2)
    @cart.total_price.should eql(subtotal)
  end
  
  it "should be able to update products in bulk" do
    @first_product = Product.all[0]
    @second_product = Product.all[1]
    @third_product = Product.all[2]
    @cart.add_product(@first_product.id)
    @cart.add_product(@second_product.id)
    @cart.add_product(@third_product.id)

    @cart.total_items.should eql(3)
    products = { "product_id" => @first_product.id, "quantity" => 2 }, { "product_id" => @second_product.id, "quantity" => 3 }, { "product_id" => "ABC", "quantity" => "ABC" }
    @cart.update_products(products)
    @cart.total_items.should eql(6)
    @cart.total_price.should eql((@first_product.price * 2) + (@second_product.price * 3) + @third_product.price)
  end
  
  it "should remove an item from the cart if it's quantity is set to 0" do
    @product = Product.first
    @cart.add_product(@product.id)
    @cart.total_items.should eql(1)
    
    products = [{ "product_id" => @product.id, "quantity" => 0 }]
    @cart.update_products(products)
    @cart.products.size.should eql(0)
  end
  
end
