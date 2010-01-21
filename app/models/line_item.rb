class LineItem < ActiveRecord::Base

  belongs_to :product
  belongs_to :order
  
  validates_presence_of :product, :order, :quantity
  
  before_save :assign_price
  
  def assign_price
    self.price = product.price
  end
  
  def total
    quantity*price
  end
  
end
