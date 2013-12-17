App.ApplicationRoute = Ember.Route.extend
  beforeModel: (transition) ->
    auth = @controllerFor('authentication')
    auth.extractAccessToken()
    if not auth.get('isAuthenticated')
      transition.abort()
      auth.redirectToSignIn()

  model: ( ->
  )

App.IndexRoute = Ember.Route.extend
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

