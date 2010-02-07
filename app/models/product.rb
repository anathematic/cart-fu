class Product < ActiveRecord::Base

  validates_presence_of :name, :description, :price
  
  has_many :line_items
  has_one :photo
  
  # before_validation_on_create :ensure_photo_exists
  accepts_nested_attributes_for :photo
  
  def validate
    errors.add(:photo, "must require an inital photo") if photo.blank?
  end
  
end
