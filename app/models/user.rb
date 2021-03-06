class User < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :name, :role, :role_cd, :password, :password_confirmation, :email, :remember_token

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

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
  as_enum :role, [:manager, :last_mile], :column => 'role_cd'

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  

end
