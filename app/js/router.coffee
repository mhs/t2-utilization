App.Router.map ->
  @resource 'snapshots', ->
    @resource 'snapshot', {path: ':snapshot_id'}

  @resource 'offices', ->
    @resource 'office', {path: ':office_name'}

