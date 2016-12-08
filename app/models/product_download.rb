class ProductDownload < ActiveRecord::Base
   belongs_to :product
   belongs_to :download
end