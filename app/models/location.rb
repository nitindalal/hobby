class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name, :type

  attr_accessor :type

  acts_as_gmappable :process_geocoding => false

  def to_coordinates
    [self.latitude, self.longitude]
  end
end