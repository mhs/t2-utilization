App.SnapshotsRoute = Ember.Route.extend
  model: ->
    @get('store').findAll('snapshot')
    #App.Snapshot.find()
