`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`

Ember.MODEL_FACTORY_INJECTIONS = true

App = Ember.Application.extend
  modulePrefix : 'utilization'
  Resolver     : Resolver

loadInitializers(App, 'utilization')

`export default App`
