class Photo < ActiveRecord::Base

  belongs_to :product
  
  has_attached_file :photo, 
                    :default_url => "/images/missing/photos_:style_missing.png",
                    :path => ":rails_root/public/images/photos/:id_:style_:basename.:extension",
                    :url => "/images/photos/:id_:style_:basename.:extension",
                    :styles => { :thumb => "150x150", :medium => "400x400" }
  
  validates_attachment_presence :photo
  
  delegate :url, :to => :photo
  
end
