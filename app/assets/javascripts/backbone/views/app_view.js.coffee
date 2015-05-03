class Hikeezee.Views.AppView extends Backbone.View
  el: 'body'

  initialize: ()=>
    alert 'initialized'

  render: () =>
    @el