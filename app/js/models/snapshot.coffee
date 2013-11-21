App.Snapshot = DS.Model.extend
  snapDate: DS.attr('date')
  staff: DS.hasMany('person')
  overhead: DS.hasMany('person')
  billable: DS.hasMany('person')
  unassignable: DS.hasMany('person')
  assignable: DS.hasMany('person')
  billing: DS.hasMany('person')
  non_billing: DS.hasMany('person')
  office_id: DS.attr('string')

  formattedSnapDate:((key, string) ->
    if arguments.length >1
      [y, m, d] = string.split('-')
      @set('snapDate', new Date(y, m - 1, d))
    moment(@get('snapDate')).format("YYYY-MM-DD")
  ).property('snapDate')


  utilization:(->
    assignables = @get('assignable.length')
    if assignables > 0
      Math.round(100.0 * @get('billing.length') / @get('assignable.length'))
    else
      0
  ).property('billing','assignable')
