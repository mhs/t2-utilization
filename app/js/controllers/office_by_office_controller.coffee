App.OfficeByOfficeController = Ember.ArrayController.extend
  officeInfo: (->
    @get('content')
  ).property('content.@each')
