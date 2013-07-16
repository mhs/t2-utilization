App.SnapshotsRoute = Ember.Route.extend
  model: ->
    App.Snapshot.find()
