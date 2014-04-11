Router = Ember.Router.extend()

Router.map ->
  @route 'sign_out'
  @resource 'snapshots', ->
    @resource 'snapshot', {path: ':snapshot_id'}

  @resource 'offices', ->
    @resource 'office', {path: ':office_name/:snap_date'}

`export default Router`
