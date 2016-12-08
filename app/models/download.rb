class Download < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    mount_uploaders :downloads, DownloadUploader
    
    serialize :downloads, Array
    
    validates :name, presence: true
    validates :slug, presence: true, uniqueness: true
end