class UsersController < ApplicationController
  
  before_filter :require_user, :only => ['edit']
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to edit_user_path(@user)
      flash[:notice] = "Successfully Created Account"
    else
      render(:action => "new")
    end
  end
  
  def edit
    @user = current_user
  end
  
end
