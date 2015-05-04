class Hobby.Routers.ApplicationRouter extends Backbone.Router
  
  routes:
    'routes'               : 'routes_show'

  initialize: (options) ->
    @app_view = new Hobby.Views.AppView()
    @app_view.render()

  routes_show: =>
    @route_view = new Hobby.Views.RouteView()
    $('.results').html @route_view.render()