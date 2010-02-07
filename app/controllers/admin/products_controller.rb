class Admin::ProductsController < ApplicationController
  
  before_filter :require_admin
  before_filter :product, :only => ['show', 'edit', 'update', 'destroy']
  layout "admin"

  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
    @product.build_photo
  end
  
  def create
    @product = Product.new(params[:product])
    
    if @product.save
      redirect_to admin_product_path(@product)
      flash[:notice] = "Successfully Created Product"
    else
      render(:action => "new")
    end
  end
  
  def update
    if @product.update_attributes(params[:product])
      redirect_to admin_product_path(@product)
      flash[:notice] = "Successfully Updated Product"
    else
      render(:action => "edit")
    end
  end
  
  def destroy
    if @product.destroy
      redirect_to admin_products_path
      flash[:notice] = "Successfully Destroyed Product"
    end
  end
  
  private
  
    def product
      @product = Product.find(params[:id])
    end
    
end
