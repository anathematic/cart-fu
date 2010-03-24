class PaymentsController < ApplicationController
  
  before_filter :require_user
  before_filter :order
  before_filter :check_if_paid
  
  def create
    @payment = Payment.new(params[:payment])
    @payment[:order_id] = @order.id
        
    if @payment.save
      flash[:notice] = "Successfully Paid Order"
      redirect_to order_path(@order)
    else
      render(:action => "new")
    end
  end
  
  private
  
    def order
      @order = current_user.orders.find(params[:order_id])
    end
  
    def check_if_paid
      redirect_to order_path(@order) unless @order.pending_payment?
      @payment = @order.build_payment 
      # Todo - make it split and fill names for people
    end
    
end
