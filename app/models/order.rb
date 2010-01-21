class Order < ActiveRecord::Base

  belongs_to :user
  belongs_to :shipping, :class_name => "Address"
  belongs_to :billing, :class_name => "Address"
  
  validates_presence_of :user, :shipping, :billing
  
end
