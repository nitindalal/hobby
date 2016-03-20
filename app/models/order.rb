class Order < ActiveRecord::Base
  attr_accessible :destination_id, :preferred_time, :source_id, :user_id, :source, :destination, :order_type_cd, :packages_attributes, :source_type, :destination_type, :order_type, :accepted, :send_details, :final_pick_confirmation, :complete_delivery_confirmation

  attr_accessor :source, :destination, :order_type

  # remove type fields
  # how to get setter methods?
  belongs_to :user
  has_many :packages
  has_one :location, :through => :source, :dependent => :destroy
  has_one :location, :through => :destination, :dependent => :destroy 
  as_enum :order_type, [:B2B, :C2C, :B2C], :column => 'order_type_cd'

  accepts_nested_attributes_for :packages, :allow_destroy => true

  def source
    Location.find self.source_id
  end

  def destination
    Location.find self.destination_id
  end
end
