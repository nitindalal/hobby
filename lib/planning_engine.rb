class PlanningEngine
  def initialize(date=Date.today, base_location=nil)
    @date = date
    @route = Route.new()
    @base_location = base_location ||= Location.new(:latitude => 12.957903, :longitude => 77.6869605)
  end

  def generate_route()
    # orders_today = Order.select{ |order| order.preferred_time.to_date == @date }
    orders_today = Order.all
    count = 0
    orders_today.each do |order|
      order.source.type = :pickup
      order.destination.type = :drop
      @route.pickups << order.source
      @route.drops << order.destination
      count = count + 1
      break if count == 4
    end
    @route.pickups.uniq
    @route.drops.uniq

    # write the fucking algorithm
    # handle the boundary case when the pick and drop of different orders are same
    # add stops sequence to the route
    source = @base_location
    destinations = @route.pickups.clone
    while @route.drops.count > 1
      puts @route.pickups.map(&:id).join(',')
      puts @route.drops.map(&:id).join(',')
      puts destinations.map(&:id).join(',')
      nearest_destination = find_nearest(source, destinations)
      @route.stops << nearest_destination
      source = nearest_destination
      destinations.delete(nearest_destination)
      if @route.pickups.delete(nearest_destination)
        destinations << Order.select{ |order| order.source == nearest_destination }.first.destination
      else
        @route.drops.delete(nearest_destination)
      end
    end
    @route
  end

  def get_distance_and_duration(source,destination)
    begin
      result = Gmaps4rails.destination({ "from" => source.to_coordinates.join(','), "to" => destination.to_coordinates.join(',') }, {},"raw")
      sleep(1.0/10.0)
      {:distance => result[0]["distance"]["value"], :duration => result[0]["duration"]["value"]}
    rescue Gmaps4rails::DirectionStatus => e
      sleep(2)
      get_distance_and_duration(source,destination)
    end
  end

  def find_nearest(source, destinations)
    count = destinations.count
    nearest_duration = (2**(0.size * 8 -2) -1)
    nearest_destination = nil
    for index in 0..(count-1) do
      duration_from_source = get_distance_and_duration(source, destinations[index])[:distance]
      puts duration_from_source.to_s + 'from destination_id' +  destinations[index].id.to_s
      if nearest_duration > duration_from_source
        nearest_duration = duration_from_source 
        nearest_destination = destinations[index]
      end
    end
    puts 'nearest is' + nearest_destination.id.to_s
    nearest_destination
  end
end