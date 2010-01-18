class CartController < ApplicationController
  
  before_filter :product, :only => ["new"] 
    
  def new
    if @cart.add_product(@product)
      redirect_to product_path(@product)
      flash[:notice] = "Successfully Added to Cart"
    else
      redirect_to cart_path
      flash[:notice] = "Something went wrong, please try and add the item to your cart again"
    end
  end
  
end
