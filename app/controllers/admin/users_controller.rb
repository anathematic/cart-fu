class Admin::UsersController < ApplicationController

  before_filter :require_admin
  before_filter :user, :only => ['show', 'edit', 'update', 'destroy']
  layout "admin"
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to admin_user_path(@user)
      flash[:notice] = "Successfully Created User"
    else
      render(:action => "new")
    end
  end
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to admin_user_path(@user)
      flash[:notice] = "Successfully Updated User"
    else
      render(:action => "edit")
    end
  end
  
  def destroy
    if @user.destroy
      redirect_to admin_users_path
      flash[:notice] = "Successfully Destroyed User"
    end
  end
  
  private
  
    def user
      @user = User.find(params[:id])
    end
  
end
