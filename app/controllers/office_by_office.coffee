OfficeByOfficeController = Ember.ArrayController.extend
  officeInfo: (->
    @get('content')
  ).property('content.@each')

`export default OfficeByOfficeController`
