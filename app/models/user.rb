class User < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :name, :role_cd

  has_many :packages, :dependent => :destroy
  has_many :orders, :dependent => :destroy
end
