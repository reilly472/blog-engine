class User < ApplicationRecord
  before_create :set_default_role
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :user_products
  has_many :products, through: :user_products
  
  def admin?
    self.role == 'admin'
  end
  
  def moderator?
    self.role == 'moderator' || self.role == 'admin'
  end
  
  private
  
  def set_default_role
    self.role ||= "none"
  end
end
