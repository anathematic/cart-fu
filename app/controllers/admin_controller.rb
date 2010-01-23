class AdminController < ApplicationController
  
  before_filter :require_admin
  
  def index
    render(:text => "Admin")
  end
  
end
