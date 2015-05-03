class Order < ActiveRecord::Base
  attr_accessible :destination_id, :preferred_time, :source_id, :user_id, :source, :destination

  attr_accessor :source, :destination

  # remove type fields
  # how to get setter methods?
  belongs_to :user
  has_one :location, :through => :source, :dependent => :destroy
  has_one :location, :through => :destination, :dependent => :destroy

  def source
    Location.find self.source_id
  end

  def destination
    Location.find self.destination_id
  end
end
