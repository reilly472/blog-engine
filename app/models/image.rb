class Image < ActiveRecord::Base
    mount_uploaders :images, ImageUploader
    
    serialize :images, Array
end