class Order < ActiveRecord::Base

  belongs_to :user
  belongs_to :shipping, :class_name => "Address"
  belongs_to :billing, :class_name => "Address"
  
  validates_presence_of :user, :shipping, :billing
  
  accepts_nested_attributes_for :shipping, :billing
  
  attr_accessor :billing_and_shipping
  
end
