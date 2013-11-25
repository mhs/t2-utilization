App.OfficesController = Ember.ArrayController.extend
  offices: (->
    @get('content')
  ).property('content')

