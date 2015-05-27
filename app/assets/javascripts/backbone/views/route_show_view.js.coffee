class Hobby.Views.RouteShowView extends Backbone.View
  el: '#route_map'
  initialize: (options) =>
    @map_initialized = false
    @route = options.route
    @waypoints = @fetch_waypoints()

  initialize_map: () =>
    unless @map_initialized
      start_city = [12.9567746,77.6983846]
      @center = new google.maps.LatLng(start_city[0], start_city[1])
      mapOptions =
        scrollwheel: false
        styles:[
          {
            featureType: "road"
            elementType: "all"
            stylers: [
              {
                visibility: "off"
              }
            ]
          }
        ]

      @map = new google.maps.Map(@$("#route_map_view")[0], mapOptions)
      @infowindow = new google.maps.InfoWindow()
      google.maps.event.addListenerOnce @map, 'bounds_changed', =>
        @map.setZoom(8) if @map.getZoom() > 8

      @render_markers()
      @render_route()
      @map_initialized = true

  fetch_waypoints: () =>
    waypoints = _.values(jQuery.extend(true, {}, @route.stops))
    waypoints.pop()
    waypoints.shift()
    @points = []
    for point in waypoints
      stop = new google.maps.LatLng(point.latitude, point.longitude)
      @points.push({location: stop, stopover: true})
    @points

  render_markers: () =>
    @bounds = new google.maps.LatLngBounds()
    # @render_start_location_marker()
    @render_route_markers()
    # @render_route()
    @map.fitBounds @bounds
    @map.setCenter @bounds.getCenter()

  render_start_location_marker: () =>
    position = new google.maps.LatLng(12.9567746,77.6983846)
    marker = @createDestinationMarker position
    @bounds.extend position

  createDestinationMarker: (position) ->
    marker = new google.maps.Marker(
      position: position
      map: @map
      labelContent: "Text"
      labelAnchor: new google.maps.Point(3, 30)
      labelClass: "labels"
      labelInBackground: false
    )
    marker

  render_route_markers: =>
    count = 1
    for stop in @route.stops
      position = new google.maps.LatLng(stop.latitude, stop.longitude)
      marker = @createDestinationMarker position
      @bounds.extend position
      @attach_custom_info(marker, {stop: stop, count: count})
      count = count + 1

  render_route:  =>
    rendererOptions = {
      map: @map,
      suppressMarkers : true
      preserveViewport: true
    }
    directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions)
    directionsService = new google.maps.DirectionsService()
    source = new google.maps.LatLng(@route.stops[0].latitude, @route.stops[0].longitude)
    destination = new google.maps.LatLng(@route.stops[5].latitude, @route.stops[5].longitude)
    request = {
      origin: source
      destination: destination
      travelMode: google.maps.TravelMode.DRIVING
      provideRouteAlternatives: true
      waypoints: @waypoints
    }
    directionsService.route(request, (response, status) =>
      if (status == google.maps.DirectionsStatus.OK)
        directionsDisplay.setDirections(response)
    )

  attach_custom_info: (marker, data) =>
    google.maps.event.addListener marker, "mouseover", =>
      @infowindow.setContent "<p>" + data.count + ',' + data.stop.name +  "</p>"
      @infowindow.open @map, marker
      $(".gm-style-iw").next("div").remove()
    google.maps.event.addDomListener window, 'click', =>
      @infowindow.close()

  render: () =>
    @initialize_map()
    @el