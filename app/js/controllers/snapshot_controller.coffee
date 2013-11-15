App.SnapshotController = Ember.ObjectController.extend
  filterName: "staff"
  actions:
    setFilter: (name) ->
      @set('filterName', name)

  filteredList: (->
    filterName = @get("filterName")
    @get(filterName)
  ).property("filterName")


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
