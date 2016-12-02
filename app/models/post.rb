class Post < ActiveRecord::Base
    validates :title, presence: true, length: {minimum: 5}
    validates :body, presence: true
    
    def body_display
      read_attribute(:body).html_safe
    end
end