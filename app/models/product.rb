class Product < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    validates :slug, uniqueness: true
    
    has_many :user_products
    has_many :users, through: :user_products
    
    has_many :product_downloads
    has_many :downloads, through: :product_downloads
end