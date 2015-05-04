class Hobby.Views.RouteView extends Backbone.View
  el: '#route_map'
  initialize: () =>
    @map_initialized = false

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
      # @render_route()
      @map_initialized = true

  render_markers: () =>
    @bounds = new google.maps.LatLngBounds()
    @render_start_location_marker()

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
    )
    marker

  render: () =>
    @initialize_map()
    @el