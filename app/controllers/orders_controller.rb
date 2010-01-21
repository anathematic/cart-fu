class OrdersController < ApplicationController
  
  before_filter :require_user
  before_filter :check_if_paid 
  
  def new
    @order = current_user.orders.new
    @order.build_shipping
    @order.build_billing
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
  
  def show
    @order = current_user.orders.find(params[:id])
  end
  
  def pay
    @order = current_user.orders.find(params[:id])
  end
  
  private
  
    def check_if_paid
      redirect_to order_path(@order) unless @order.new?
    end
  
end
