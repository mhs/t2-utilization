App.Router.map ->
  @resource 'snapshots', ->
    @resource 'snapshot',
       path: ':snapshot_id'
