`import Ember from 'ember'`

IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('offices')

  actions:
    loading: ->
      unless @get('loadingView')
        view = @container.lookup('view:loading').append()
        @set('loadingView', view)

      @router.one('didTransition', =>
        @get('loadingView').destroy()
      )

`export default IndexRoute`
