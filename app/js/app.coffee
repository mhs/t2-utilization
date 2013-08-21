window.App = Ember.Application.create
  LOG_STACKTRACE_ON_DEPRECATION : true,
  LOG_BINDINGS                  : true,
  LOG_TRANSITIONS               : true,
  LOG_TRANSITIONS_INTERNAL      : true,
  LOG_VIEW_LOOKUPS              : true,
  LOG_ACTIVE_GENERATION         : true,

  rake:
    routes: ->
      console.log Em.keys(App.Router.router.recognizer.names)

    templates: ->
      console.log Em.keys(Em.TEMPLATES)

Ember.RSVP.configure "onerror", (e) ->
  console.log e.message
  console.log e.stack

ev = (emberId) ->
  Ember.View.views["ember" + emberId]
ec = (emberId) ->
  ev(emberId).get "controller"
