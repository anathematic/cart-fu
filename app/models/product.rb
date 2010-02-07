class Product < ActiveRecord::Base

  validates_presence_of :name, :description, :price
  
  has_many :line_items
  has_one :photo
  
  accepts_nested_attributes_for :photo
  # accepts_nested_attributes_for :photos
  
  def validate
    errors.add(:photo, "must require an inital photo") if photo.blank?
  end
  
end
