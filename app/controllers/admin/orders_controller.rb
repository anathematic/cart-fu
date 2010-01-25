class Admin::OrdersController < ApplicationController

  before_filter :require_admin
  before_filter :product, :only => ['show', 'edit', 'update', 'destroy']
  layout "admin"
  
  def index
    @orders = Order.all
  end
  
  def update
    if @order.update_attributes(params[:order])
      redirect_to admin_order_path(@order)
      flash[:notice] = "Successfully Updated Order"
    else
      render(:action => "show")
    end
  end
  
  private
  
    def order
      @order = Order.find(params[:id])
    end
    
end
