`import Ember from 'ember'`

SnapshotRoute = Ember.Route.extend
  model: (params) ->
    snapshots = @modelFor('snapshots')
    snapshots.findBy('id', params.snapshot_id)

`export default SnapshotRoute`
