class CheckoutController < ApplicationController
  
  def new
    @order = Order.new
    @order.build_shipping_address
    @order.build_billing_address
  end
  
end
