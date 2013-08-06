App.Store = DS.Store.extend
  revision: 12,
  adapter: DS.RESTAdapter.extend
    url: 'http://localhost:5000'

DS.RESTAdapter.reopen
  namespace: 'api/v1'

DS.RESTAdapter.configure "plurals", person: "people"
