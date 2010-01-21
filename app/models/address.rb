class Address < ActiveRecord::Base

  belongs_to :order
  
  validates_presence_of :name, :address1, :suburb, :postcode, :country, :state, :phone, :order
  
end
