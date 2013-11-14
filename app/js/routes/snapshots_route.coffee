App.SnapshotsRoute = Ember.Route.extend
  model: ->
    @get('store').findAll('snapshot')

App.SnapshotsIndexRoute = Ember.Route.extend

  model: ->
    @get('store').findAll('snapshot')

  afterModel: (model) ->
    @transitionTo('snapshot', model.get('firstObject'))
