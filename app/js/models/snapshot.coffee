App.Snapshot = DS.Model.extend
  snapDate: DS.attr('string')
  staff: DS.hasMany('App.Person')
  overhead: DS.hasMany('App.Person')
  billable: DS.hasMany('App.Person')
  unassignable: DS.hasMany('App.Person')
  assignable: DS.hasMany('App.Person')
  billing: DS.hasMany('App.Person')
  non_billing: DS.hasMany('App.Person')
  office_id: DS.attr('string')

  formattedSnapDate: (-> moment(date).format("MMMM DD, YYYY")).property('snapDate')

  utilization:(->
    assignables = @get('assignable.length')
    if assignables > 0
      Math.round(100.0 * @get('billing.length') / @get('assignable.length'))
    else
      0
  ).property('billing','assignable')
