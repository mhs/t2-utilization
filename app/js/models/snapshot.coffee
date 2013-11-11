App.Snapshot = DS.Model.extend
  snapDate: DS.attr('string')
  staff: DS.hasMany('person')
  overhead: DS.hasMany('person')
  billable: DS.hasMany('person')
  unassignable: DS.hasMany('person')
  assignable: DS.hasMany('person')
  billing: DS.hasMany('person')
  non_billing: DS.hasMany('person')
  office_id: DS.attr('string')

  utilization:(->
    assignables = @get('assignable.length')
    if assignables > 0
      Math.round(100.0 * @get('billing.length') / @get('assignable.length'))
    else
      0
  ).property('billing','assignable')
