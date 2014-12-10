`import Ember from 'ember';`
`import config from './config/environment';`

Router = Ember.Router.extend(
  location: config.locationType
)

Router.map( ->
  @route 'sign_out'
  @resource 'snapshots', ->
    @resource 'snapshot', {path: ':snapshot_id'}

  @resource 'offices', ->
    @resource 'office', {path: ':office_name/:snap_date'}
)

`export default Router;`
