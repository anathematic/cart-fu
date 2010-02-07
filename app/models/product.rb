class Product < ActiveRecord::Base

  validates_presence_of :name, :description, :price
  
  has_many :line_items
  has_one :photo
  
  def dom_id
    "product_" + id.to_s
  end
  
end
