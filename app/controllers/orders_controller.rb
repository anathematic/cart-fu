class OrdersController < ApplicationController
  
  before_filter :require_user
  
  def new
    @order = Order.new
    @order.build_shipping
    @order.build_billing
  end
  
end
