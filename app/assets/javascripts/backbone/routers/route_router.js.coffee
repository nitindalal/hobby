class Hobby.Routers.RouteRouter extends Backbone.Router
  
  routes:
    'routes/:id'               : 'routes_show'

  initialize: (options) ->
    # @app_view = new Hobby.Views.AppView()
    # @app_view.render()
    @route = options.route

  routes_show: =>
    @route_show_view = new Hobby.Views.RouteShowView({route: @route, waypoints: @waypoints})
    $('.results').html @route_show_view.render()