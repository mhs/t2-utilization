`import d3StackChart from 'utilization/utils/d3-stack-chart'`

UtilizationChartController = Ember.ArrayController.extend
  needs: ['office', 'lists']

  init: ->
    @_super()
    @get('hovering')

  chartData: (->
    dates = @mapBy('date').map((date) -> Date.parse(date))
    makeLayer = (name, xValues, yValues) ->
      name: name
      startDate: xValues.get('firstObject')
      endDate: xValues.get('lastObject')
      values: xValues.map (xVal, i) ->
        {x: xVal, y: yValues[i]}

    data =
      snapDate: @get('controllers.office.formattedSnapDate')
      layers:
        [ makeLayer("billing", dates, @mapBy('billing_count')),
          makeLayer("nonbilling", dates, @mapBy('non_billing_count')),
          makeLayer("unavailable", dates, @mapBy('unassignable_count'))
          makeLayer("overhead", dates, @mapBy('overhead_count')),
        ]
  ).property('model.@each')

  chart: d3StackChart()

  hovering: Ember.computed.alias('controllers.lists.hovering')

  hoveringChanged: (->
    svg = $("svg")
    hovering = @get('hovering')
    if hovering
      key = hovering.get('key')
    else
      key = 'staff'
    all_paths = [".billing", ".nonbilling", ".unavailable", ".overhead"]

    dimmed_paths = @get('dimmingList')[key]

    all_paths.forEach (path) ->
      # CAUTION: this is weird because jQuery's SVG support doesn't
      #          provide addClass due to... reasons
      #
      if dimmed_paths.contains(path)
        svg.find(path)[0].classList.add('dimmed')
      else
        svg.find(path)[0].classList.remove('dimmed')

  ).observes('hovering')

  dimmingList:
    staff: [""]
    overhead: [".billing", ".nonbilling", ".unavailable"]
    billable: [".overhead"]
    billing: [".nonbilling", ".unavailable", ".overhead"]
    nonBilling: [".billing", ".unavailable", ".overhead"]
    assignable: [".unavailable", ".overhead"]
    unassignable: [".billing", ".nonbilling", ".overhead"]
    overallocated: [""]

`export default UtilizationChartController`
