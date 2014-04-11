`import Resolver from 'ember/resolver'`

App = Ember.Application.extend
  LOG_STACKTRACE_ON_DEPRECATION : true,
  LOG_BINDINGS                  : true,
  LOG_TRANSITIONS               : true,
  LOG_TRANSITIONS_INTERNAL      : true,
  LOG_VIEW_LOOKUPS              : true,
  LOG_ACTIVE_GENERATION         : true,
  modulePrefix                  : 't2-utilization',
  Resolver                      : Resolver

`export default App`
