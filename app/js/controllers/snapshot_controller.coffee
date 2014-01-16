App.SnapshotController = Ember.ObjectController.extend
  filterName: "staffWeights"
  actions:
    setFilter: (name) ->
      @set('filterName', name)

    chartHighlight: (name) ->
      name = "staff" unless name
      svg = $("svg")
      all_paths = [".billing", ".nonbilling", ".unavailable", ".overhead"]
      dimmed =
        staffWeights: [""]
        overheadWeights: [".billing", ".nonbilling", ".unavailable"]
        billableWeights: [".overhead"]
        billingWeights: [".nonbilling", ".unavailable", ".overhead"]
        nonBillingWeights: [".billing", ".unavailable", ".overhead"]
        assignableWeights: [".unavailable", ".overhead"]
        unassignableWeights: [".billing", ".nonbilling", ".overhead"]
      svg.find(dimmed[name].join(', ')).attr("class", (index, classNames) ->
        classNames + " " + "dimmed"
        )

      highlighted = all_paths.reject (e) ->
        dimmed[name].contains(e)
      svg.find(highlighted.join(', ')).attr("class", (index, classNames) ->
        classNames.replace("dimmed", "")
        )

      # highlight =
      #   staff: [""]
      #   overhead: [".overhead"]
      #   billable: [".billing", ".nonbilling", ".unavailable"]
      #   billing: [".billing"]
      #   non_billing: [".nonbilling"]
      #   assignable: [".billing", ".nonbilling"]
      #   unassignable: [".unavailable"]
      # svg.find(highlight[name].join(', ')).attr("class", (index, classNames) ->
      #   classNames + " " + "highlight"
      #   )

      # highlighted = all_paths.reject (e) ->
      #   highlight[name].contains(e)
      # svg.find(highlighted.join(', ')).attr("class", (index, classNames) ->
      #   classNames.replace("highlight", "")
      #   )

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

    [makeType("staffWeights", "Staff"),
    makeType("overheadWeights", "Overhead"),
    makeType("billableWeights", "Billable"),
    makeType("billingWeights", "Billing"),
    makeType("nonBillingWeights", "Non-Billing"),
    makeType("assignableWeights", "Assignable"),
    makeType("unassignableWeights", "Unavailable")]
    ).property("filterName")
