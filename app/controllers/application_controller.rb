# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  helper_method :current_user_session, :current_user
  
  # I'm finding the cart so it's loaded up on the whole website, there's probably a better way to do this but I'm okay flooding someone else's cookies until then.
  before_filter :cart
    
   private
  
   def require_user
     unless current_user
       store_location
       flash[:notice] = "You must be logged in to access this page"
       redirect_to new_user_session_path
       return false
     end
   end
   
   def require_admin
     unless current_user and current_user.admin?
       store_location
       flash[:notice] = "You must be an admin to access this page"
       redirect_to new_user_session_path
       return false
     end
   end

   def store_location
     session[:return_to] = request.request_uri
   end

   def require_no_user
     if current_user
       store_location
       flash[:notice] = "You must be logged out to access this page"
       redirect_to root_url
       return false
     end
   end
   
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

   def current_user
     return @current_user if defined?(@current_user)
     @current_user = current_user_session && current_user_session.user
   end
  
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
