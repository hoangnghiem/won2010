class Photo < ActiveRecord::Base
  belongs_to :item
  has_attached_file :data, 
                    :styles => { :medium => "300x300>", :thumb => "100x100#" },
                    :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension",
                    :url => "/assets/photos/:id/:style/:basename.:extension"
end
