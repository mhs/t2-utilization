window.App = Ember.Application.create({
  LOG_STACKTRACE_ON_DEPRECATION : true,
  LOG_BINDINGS                  : true,
  LOG_TRANSITIONS               : true,
  LOG_TRANSITIONS_INTERNAL      : true,
  LOG_VIEW_LOOKUPS              : true,
  LOG_ACTIVE_GENERATION         : true,

  rake: {
    routes: ->
      console.log(Em.keys(App.Router.router.recognizer.names))

    templates: ->
      console.log(Em.keys(Em.TEMPLATES))
  }
})

App.Store = DS.Store.extend
  revision: 12,
  adapter: DS.RESTAdapter.extend
    url: 'http://localhost:3000'

DS.RESTAdapter.reopen
  namespace: 'api/v1'
