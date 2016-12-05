class ClickTracker < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    validates :name, presence: true
    validates :url, presence: true
    validates :slug, uniqueness: true
end