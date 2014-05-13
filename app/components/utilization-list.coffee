UtilizationListComponent = Ember.Component.extend
  classNames: ["utilization-list"]

  list: (->
    @get('property').map (person) ->
      if person.percentage > 100
        percent = 100
        person.set('overallocated', true)
      else
        percent = person.percentage
      person.set('width', "width: #{percent}%")
      person
  ).property('property')

`export default UtilizationListComponent`
