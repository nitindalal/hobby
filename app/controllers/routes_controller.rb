class RoutesController < ApplicationController
  def index

    pe = Route.planning_engine_element
    # @route = pe.generate_route()
    # @route = JSON.parse "{\"_id\":\"5544c1bd0d4c9c7739000002\",\"created_at\":null,\"drops\":[{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":90,\"latitude\":12.964929,\"longitude\":77.596871,\"name\":\"Bangalore Sub Fgn Post\",\"updated_at\":\"2015-05-01T21:46:44Z\"}],\"pickups\":[{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":65,\"latitude\":12.994827,\"longitude\":77.733197,\"name\":\"Belathur\",\"updated_at\":\"2015-05-01T21:46:44Z\"}],\"stops\":[{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":75,\"latitude\":12.986674,\"longitude\":77.647881,\"name\":\"C.V.Raman Nagar\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":68,\"latitude\":12.993665,\"longitude\":77.595712,\"name\":\"Vasanthnagar\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":93,\"latitude\":13.005139,\"longitude\":77.593859,\"name\":\"Benson Town\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":67,\"latitude\":13.016828,\"longitude\":77.560753,\"name\":\"Science Institute\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":69,\"latitude\":12.960479,\"longitude\":77.56842,\"name\":\"Cubban Road\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":70,\"latitude\":12.939985,\"longitude\":77.597624,\"name\":\"Jayangar III Block\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":92,\"latitude\":13.006452,\"longitude\":77.62782,\"name\":\"Maruthi Sevanagar\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":95,\"latitude\":13.014517,\"longitude\":77.584141,\"name\":\"Aranya Bhavan\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":94,\"latitude\":13.042682,\"longitude\":77.590336,\"name\":\"Training Command IAF\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":74,\"latitude\":13.097872,\"longitude\":77.567033,\"name\":\"Yelahanka New Town\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":71,\"latitude\":13.062417,\"longitude\":77.506598,\"name\":\"Chikkabanavara\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":72,\"latitude\":13.031579,\"longitude\":77.503704,\"name\":\"Dasarahalli\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":73,\"latitude\":12.982175,\"longitude\":77.431466,\"name\":\"Herohalli\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":66,\"latitude\":12.812747,\"longitude\":77.542204,\"name\":\"Gottigere\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":91,\"latitude\":13.003572,\"longitude\":77.584082,\"name\":\"Vyalikaval Extn\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":97,\"latitude\":12.992263,\"longitude\":77.64318,\"name\":\"Jeevanahalli\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":96,\"latitude\":12.967231,\"longitude\":77.661151,\"name\":\"New Thippasandra\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":98,\"latitude\":12.964193,\"longitude\":77.649408,\"name\":\"Indiranagar Com. Complex\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":99,\"latitude\":12.959728,\"longitude\":77.649848,\"name\":\"Domlur\",\"updated_at\":\"2015-05-01T21:46:44Z\"},{\"created_at\":\"2015-05-01T21:46:44Z\",\"id\":100,\"latitude\":12.9507,\"longitude\":77.689511,\"name\":\"Bangalore Air Port\",\"updated_at\":\"2015-05-01T21:46:44Z\"}],\"updated_at\":null}"
    # @json = @route.stops.to_gmaps4rails
    # @json = stop_to_gmaps_json(@route.stops)
    # @way_points = @route.stops.clone
    # @way_points.pop
    # @way_points = @way_points.drop(1)
    # @way_points = @way_points.map{|a| a.to_coordinates.join(',')}
    # @json = "[{\"lat\":12.986674,\"lng\":77.647881},{\"lat\":12.993665,\"lng\":77.595712},{\"lat\":13.005139,\"lng\":77.593859},{\"lat\":13.016828,\"lng\":77.560753},{\"lat\":12.960479,\"lng\":77.56842},{\"lat\":12.939985,\"lng\":77.597624},{\"lat\":13.006452,\"lng\":77.62782},{\"lat\":13.014517,\"lng\":77.584141},{\"lat\":13.042682,\"lng\":77.590336},{\"lat\":13.097872,\"lng\":77.567033},{\"lat\":13.062417,\"lng\":77.506598},{\"lat\":13.031579,\"lng\":77.503704},{\"lat\":12.982175,\"lng\":77.431466},{\"lat\":12.812747,\"lng\":77.542204},{\"lat\":13.003572,\"lng\":77.584082},{\"lat\":12.992263,\"lng\":77.64318},{\"lat\":12.967231,\"lng\":77.661151},{\"lat\":12.964193,\"lng\":77.649408},{\"lat\":12.959728,\"lng\":77.649848},{\"lat\":12.9507,\"lng\":77.689511}]"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @json }
    end
  end
end

private

def stop_to_gmaps_json(stops)
  markers = []
  stops.each do |stop|
    marker = {}
    marker["lat"] = stop.latitude
    marker["lng"] = stop.longitude
    marker["title"] = stop.type.to_s + '_' + stop.id.to_s
    marker["description"] = stop.type.to_s + '_' + stop.id.to_s
    markers << marker
  end
  markers.to_json
end