class UserSessionsController < ApplicationController
  
  before_filter :require_no_user, :except => ['destroy', 'create']
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    
    if @user_session.save
      redirect_to session[:return_to] || root_url
      flash[:notice] = "Successfully Logged In"
    else
      render(:action => "new")
      flash[:notice] = "Wrong username and password"
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Successfully Logged Out"
    redirect_to root_url
  end
  
end
