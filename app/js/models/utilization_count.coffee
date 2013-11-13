App.UtilizationCount = DS.Model.extend
  date: DS.attr('string')
  staff_count: DS.attr('number')
  overhead_count: DS.attr('number')
  billable_count: DS.attr('number')
  unassignable_count: DS.attr('number')
  assignable_count: DS.attr('number')
  billing_count: DS.attr('number')
  non_billing_count: DS.attr('number')
  office_id: DS.attr('number')

