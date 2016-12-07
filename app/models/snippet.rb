class Snippet < ActiveRecord::Base
    validates :name, presence: true
    validates :body, presence: true
    validates :code, presence: true
    validates_format_of :code, with: /\A[_a-z0-9]*\z/, message: "Code can only use lowercase letters, numbers, and underscores."
end