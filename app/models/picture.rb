class Picture < ActiveRecord::Base
  mount_uploader :picture, ImageUploader
  belongs_to :owner, class_name: "User"

  validates :caption, presence: true
  validates :picture, presence: { message: "must be provided to upload" }
end
