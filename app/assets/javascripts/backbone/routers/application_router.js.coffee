class Hikeezee.Routers.ApplicationRouter extends Backbone.Router
  initialize: (options) ->
    @app_view = new Hikeezee.Views.AppView()
    @app_view.render()