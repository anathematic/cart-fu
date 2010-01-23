class Admin::ProductsController < ApplicationController
  
  before_filter :require_admin
  layout "admin"
      
end
