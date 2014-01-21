App.UtilizationListComponent = Ember.Component.extend
  classNames: ["utilization-list"]

  list: (->
    @get('property').map (person) ->
      person.set('width', "width: #{person.percentage}%")
      person
  ).property('property')
