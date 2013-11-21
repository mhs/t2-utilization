App.UtilizationCount = DS.Model.extend
  date: DS.attr('date')
  staff_count: DS.attr('number')
  overhead_count: DS.attr('number')
  billable_count: DS.attr('number')
  unassignable_count: DS.attr('number')
  assignable_count: DS.attr('number')
  billing_count: DS.attr('number')
  non_billing_count: DS.attr('number')
  office_id: DS.attr('number')

  formattedDate: (-> moment(date).format("MMMM DD, YYYY")).property('date')

  utilization:(->
    assignables = @get('assignable_count')
    if assignables > 0
      Math.round(100.0 * @get('billing_count') / @get('assignable_count'))
    else
      0
  ).property('billing_count','assignable_count')

