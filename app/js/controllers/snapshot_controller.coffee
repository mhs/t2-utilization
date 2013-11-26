App.SnapshotController = Ember.ObjectController.extend
  filterName: "staff"
  actions:
    setFilter: (name) ->
      @set('filterName', name)
      chartHighlight: (name) ->



  filteredList: (->
    filterName = @get("filterName")
    @get(filterName)
  ).property("filterName", "office_id")

  currentStaffType: (->
    types = @get('staffTypes')
    type = types.findBy('name', @get('filterName'))
    type.title
  ).property('filterName')

  staffTypes: (->
    makeType = (name, title) =>
      active = (name == @get('filterName'))
      {name: name, title: title, active: active}

    [makeType("staff", "Staff"),
    makeType("overhead", "Overhead"),
    makeType("billable", "Billable"),
    makeType("billing", "Billing"),
    makeType("non_billing", "Non-Billing"),
    makeType("assignable", "Available"),
    makeType("unassignable", "Unavailable")]
    ).property("filterName")
