class CheckoutController < ApplicationController
  
  def new
    @order = Order.new
    @order.build_shipping
    @order.build_billing
  end
  
end
