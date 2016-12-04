class Snippet < ActiveRecord::Base
    validates :name, presence: true
    validates :body, presence: true
    validates :code, presence: true
end