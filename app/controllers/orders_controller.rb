class OrdersController < ApplicationController
  
  before_filter :require_user
  before_filter :order, :only => ['show', 'pay', 'edit', 'update']
  
  def index
    @orders = current_user.orders.all
  end
  
  def new
    @order = current_user.orders.new
    @order.build_shipping
    @order.build_billing
    @order.line_items.build
  end
  
  def create
    @order = current_user.orders.new(params[:order])
    @order.build_shipping(params[:order][:shipping_attributes])
    @order.build_billing(params[:order][:billing_attributes]) unless params[:order][:billing_and_shipping]
    @order.build_billing(params[:order][:shipping_attributes]) if params[:order][:billing_and_shipping]
    
    if @order.save
      load_cart_into_line_items
      redirect_to new_order_payment_path(@order)
      flash[:notice] = "Successfully Entered Order Details"
    else
      render(:action => "new")
    end
  end
  
  def update
    if @order.update_attributes(params[:order])
      redirect_to order_path(@order)
      flash[:notice] = "Successfully Updated Order"
    else
      render(:action => "edit")
    end
  end
  
  private
  
    def order
      @order = current_user.orders.find(params[:id])
    end
    
    def load_cart_into_line_items
      @order.load_cart_items(@cart.products)
      @cart.empty_cart
    end

end
