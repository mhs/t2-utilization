OfficesController = Ember.ArrayController.extend
  offices: (->
    @get('content')
  ).property('content')

`export default OfficesController`
