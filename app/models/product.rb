class Product < ActiveRecord::Base
    has_many :user_products
    has_many :users, through: :user_products
    
    has_many :product_downloads
    has_many :downloads, through: :product_downloads
end