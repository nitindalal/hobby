class User < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :name, :role_cd, :password, :password_confirmation, :email

  before_save { |user| user.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_secure_password

  has_many :packages, :dependent => :destroy
  has_many :orders, :dependent => :destroy

  

end
