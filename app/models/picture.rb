class Picture < ActiveRecord::Base
  mount_uploader :picture, ImageUploader
  belongs_to :owner, class_name: "User"
end
