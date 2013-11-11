App.ApplicationAdapter = DS.RESTAdapter.extend
  namespace: 'api/v1'
  host: window.ENV.apiHost

App.ApplicationSerializer = DS.ActiveModelSerializer.extend()
