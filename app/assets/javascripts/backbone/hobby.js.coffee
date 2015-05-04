#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Hobby =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    @router = new Hobby.Routers.ApplicationRouter()
    Backbone.history.start({pushState: true, hashChange: false})

Backbone.EventBus = _.extend({}, Backbone.Events)
