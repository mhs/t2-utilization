ListsController = Ember.ArrayController.extend
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
    list = @get('snapshot').get(selected.get('key'))
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
      key: 'staff'
      displayName: 'Staff'
      showPercentages: false
      selected: true
      explanation: "All employees"
    Ember.Object.create
      key: 'overhead'
      displayName: 'Overhead'
      showPercentages: true
      explanation: "Some or all time is non-billable"
    Ember.Object.create
      key: 'billable'
      displayName: 'Billable'
      showPercentages: true
      explanation: "Expected to do client work some or all of the time"
    Ember.Object.create
      key: 'billing'
      displayName: 'Billing'
      showPercentages: true
      explanation: "Allocated to work for which a client is billed"
    Ember.Object.create
      key: 'nonBilling'
      displayName: 'Non-Billing'
      showPercentages: true
      explanation: "Doing work for which no client is billed"
    Ember.Object.create
      key: 'unassignable'
      displayName: 'Unassignable'
      showPercentages: false
      explanation: "Out on personal time"
    Ember.Object.create
      key: 'assignable'
      displayName: 'Assignable'
      showPercentages: true
      explanation: "Billable and not on personal time"
    Ember.Object.create
      key: 'overallocated'
      displayName: 'Overallocated'
      showPercentages: true
      explanation: "Capacity above billable capacity allocated to projects"
    ]

`export default ListsController`
