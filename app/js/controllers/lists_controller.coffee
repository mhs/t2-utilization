App.ListsController = Ember.ArrayController.extend
  needs: ['snapshot']

  selected: (->
    @get('model').findBy('selected')
  ).property('model.@each.selected')

  hovering: (->
    @get('model').findBy('hovering')
  ).property('model.@each.hovering')

  list: (->
    # grab the correct list from the snapshot
    # filter with the selected list's filter function if needed
    selected = @get('selected')
    return [] unless selected
    property = selected.get('property') || selected.get('key')
    list = @get('snapshot').get(property)
    list.filter(selected.get('filter'))
  ).property('selected', 'snapshot')

  snapshot: Ember.computed.alias('controllers.snapshot.model')

  actions:
    select: (list) ->
      @get('model').setEach('selected', false)
      list.set('selected', true)
    highlight: (item) ->
      item.set('hovering', true)
    clearHighlight: (item) ->
      item.set('hovering', false)


  model: [
    Ember.Object.create
      key: 'staffWeights'
      displayName: 'Staff'
      showPercentages: false
      selected: true
      filter: -> true
    Ember.Object.create
      key: 'overheadWeights'
      property: 'staffWeights'
      displayName: 'Overhead'
      showPercentages: true
      filter: (person) -> person.percentage < 100
    Ember.Object.create
      key: 'billableWeights'
      property: 'staffWeights'
      displayName: 'Billable'
      showPercentages: true
      filter: (person) -> person.percentage > 0
    Ember.Object.create
      key: 'billingWeights'
      displayName: 'Billing'
      showPercentages: true
      filter: -> true
    Ember.Object.create
      key: 'nonBillingWeights'
      displayName: 'Non-Billing'
      showPercentages: false
      filter: -> true
    Ember.Object.create
      key: 'unassignableWeights'
      displayName: 'Unassignable'
      showPercentages: false
      filter: -> true
    Ember.Object.create
      key: 'assignableWeights'
      displayName: 'Assignable'
      showPercentages: true
      filter: -> true
    ]

