App.SnapshotsRoute = Ember.Route.extend
  model: ->
    App.Snapshot.find()

# App.SnapshotRoute = Ember.Route.extend
#  model: ->
#    App.Snapshot.find(params.snapshot_id)

