class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username
  
  before_create :set_default_role
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
  validates :username,
    :presence => true,
    :uniqueness => {:case_sensitive => false},
    length: {minimum: 3, maximum: 12}
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username
      
  has_many :user_products
  has_many :products, through: :user_products
  
  def admin?
    self.role == 'admin'
  end
  
  def moderator?
    self.role == 'moderator' || self.role == 'admin'
  end
  
  def login=(login)
    @login = login
  end
  
  def super_admin?
    self.super_admin
  end

  def login
    @login || self.username || self.email
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash ).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

  private
  
  def set_default_role
    self.role ||= "none"
  end
  
  def validate_username
  if User.where(email: username).exists?
    errors.add(:username, :invalid)
  end
end
end
