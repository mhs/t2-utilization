`import Ember from 'ember';`

SnapshotsRoute = Ember.Route.extend
  model: ->
   @get('store').findAll('snapshot')

`export default SnapshotsRoute;`
