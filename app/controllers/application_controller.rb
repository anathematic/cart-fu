# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  # I'm finding the cart so it's loaded up on the whole website, there's probably a better way to do this but I'm okay flooding someone else's cookies until then.
  before_filter :cart
  
  def cart
    @cart = find_cart
  end
  
  def find_cart 
    session[:cart] ||= Cart.new 
  end
  
  def product
    @product = Product.find(params[:product_id])
  end
  
end
