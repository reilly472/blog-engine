class Image < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    mount_uploaders :images, ImageUploader
    
    serialize :images, Array
    
    validates :name, presence: true
    validates :slug, presence: true, uniqueness: true
end