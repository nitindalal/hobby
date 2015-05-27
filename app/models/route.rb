class Route
  include Mongoid::Document
  include Mongoid::Timestamps

  field :pickups, type: Array, default: []
  field :drops, type: Array, default: []
  field :stops, type: Array, default: []

  attr_accessor :waypoints

  before_save :fetch_ids

  def self.planning_engine_element
    PlanningEngine.new
  end

  def fetch_ids
    self.pickups = self.pickups.map{|p| p.id}
    self.drops = self.drops.map{|p| p.id}
    self.stops = self.stops.map{|p| p.id}
  end
end