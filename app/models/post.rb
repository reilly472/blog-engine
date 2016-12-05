class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    validates :title, presence: true, length: {minimum: 5}
    validates :body, presence: true
    validates :slug, uniqueness: true
end