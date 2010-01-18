class Product < ActiveRecord::Base

  validates_presence_of :name, :description, :price
  
  def dom_id
    "product_" + id.to_s
  end
  
end
