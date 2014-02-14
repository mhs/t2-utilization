App.Snapshot = DS.Model.extend
  snapDate: DS.attr('date')
  staff: DS.attr('weights')
  unassignable: DS.attr('weights')
  assignable: DS.attr('weights')
  billing: DS.attr('weights')
  nonBilling: DS.attr('weights')
  utilization: DS.attr('number')
  office_id: DS.attr('string')

  formattedSnapDate:((key, string) ->
    if arguments.length >1
      [y, m, d] = string.split('-')
      @set('snapDate', new Date(y, m - 1, d))
    moment(@get('snapDate')).format("YYYY-MM-DD")
  ).property('snapDate')

  overheadWeights: (->
    @get('staff').filter (person) ->
      person.percentage < 100
  ).property('staff')

  billableWeights: (->
    @get('staff').filter (person) ->
      person.percentage > 0
  ).property('staff')
