App.SnapshotsRoute = Ember.Route.extend
  model: ->
    App.Snapshot.find()

App.SnapshotsIndexRoute = Ember.Route.extend

  model: ->
    App.Snapshot.find()

  afterModel: (model) ->
    @transitionTo('snapshot', model.get('firstObject'))

App.SnapshotRoute = Ember.Route.extend
  model: (params) ->
    snapshots = @modelFor('snapshots')
    snapshots.findBy('id', params.snapshot_id)

  serialize: (model) ->
    snapshot_id: model.id
