class OrdersController < ApplicationController
  
  before_filter :require_user
  before_filter :order, :only => ['show', 'pay']
  before_filter :check_if_paid, :only => ['pay'] 
  
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
      redirect_to pay_order_path(@order)
      flash[:notice] = "Successfully Entered Order Details"
    else
      render(:action => "new")
    end
  end
  
  private
  
    def order
      @order = current_user.orders.find(params[:id])
    end
    
    def check_if_paid
      redirect_to order_path(@order) unless @order.pending_payment?
    end
    
    def load_cart_into_line_items
      @order.load_cart_items(@cart.products)
      @cart.empty_cart
    end

end
