class Product < ActiveRecord::Base

  validates_presence_of :name, :description, :price
  
  has_many :line_items
  has_one :photo
  
  validate :ensure_photo_exists
  accepts_nested_attributes_for :photo
  # accepts_nested_attributes_for :photos
  
  def ensure_photo_exists
    errors.add(:photo, "must require an inital photo") if photo.blank?
  end
  
end
