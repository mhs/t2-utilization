App.Snapshot = DS.Model.extend
  snapDate: DS.attr('date')
  utilization: DS.attr('string')
  staff: DS.hasMany('App.Person')
  overhead: DS.hasMany('App.Person')
  billable: DS.hasMany('App.Person')
  unassignable: DS.hasMany('App.Person')
  assignable: DS.hasMany('App.Person')
  billing: DS.hasMany('App.Person')
  non_billing: DS.hasMany('App.Person')
  office_id: DS.attr('string')

