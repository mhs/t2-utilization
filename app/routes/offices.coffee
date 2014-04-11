Offices = Ember.Route.extend
  model: ->
    @store.push 'office',
      id: 1000
      name: 'Company-wide'
      slug: 'company-wide'
    @store.find('office')

  setupController: (controller, model)->
    @controllerFor('offices').set('model', model)

`export default Offices`
