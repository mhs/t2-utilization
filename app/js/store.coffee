App.Store = DS.Store.extend
  revision: 12,
  adapter: DS.RESTAdapter.extend
    url: window.ENV.apiHost

DS.RESTAdapter.reopen
  namespace: 'api/v1'

DS.RESTAdapter.configure "plurals", person: "people"
