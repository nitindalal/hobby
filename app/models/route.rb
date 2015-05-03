class Route
  include Mongoid::Document
  include Mongoid::Timestamps

  field :pickups, type: Array, default: []
  field :drops, type: Array, default: []
  field :stops, type: Array, default: []

  def self.planning_engine_element
    PlanningEngine.new
  end
end