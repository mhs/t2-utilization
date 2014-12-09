`import Ember from 'ember'`

SnapshotsIndexRoute = Ember.Route.extend

  model: ->
    @get('store').findAll('snapshot')

  afterModel: (model) ->
    @transitionTo('snapshot', model.get('firstObject'))

`export default SnapshotsIndexRoute`
