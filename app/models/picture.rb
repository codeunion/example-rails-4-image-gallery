class Picture < ActiveRecord::Base
    mount_uploader :picture, ImageUploader
end
