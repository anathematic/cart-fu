class CartController < ApplicationController
  
  before_filter :product, :only => ["new", "remove"]
    
  def new
    if @cart.add_product(@product.id)
      redirect_to product_path(@product)
      flash[:notice] = "Successfully Added to Cart"
    else
      redirect_to cart_path
      flash[:notice] = "Something went wrong, please try and add the item to your cart again"
    end
  end
  
  def update
    if @cart.update_products(params[:cart])
      redirect_to cart_index_path
      flash[:notice] = "Successfully Updated Cart"
    else
      redirect_to cart_path
      flash[:notice] = "Something went wrong, please try again and ensure your item values are valid"
    end
  end
  
  def remove
    if @cart.remove_product(@product.id)
      redirect_to cart_index_path
      flash[:notice] = "Successfully Removed from Cart"
    else
      redirect_to cart_path
      flash[:notice] = "Something went wrong, please try again and ensure you've attempted to remove a valid product"
    end
  end
  
end
