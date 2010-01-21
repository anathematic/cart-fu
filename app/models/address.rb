class Address < ActiveRecord::Base

  has_many :orders
  
  validates_presence_of :name, :address1, :suburb, :postcode, :country, :state, :phone, :order
  
end
