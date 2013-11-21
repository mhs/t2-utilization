App.UtilizationChartController = Ember.ArrayController.extend
  chartStyles: (->
    pointStrokeColor = "#fff"
    styles =
      billable:
        fillColor : "rgba(68,155,184,1)"
        strokeColor : "rgba(220,220,220,0)"
        pointColor : "rgba(220,220,220,1)"
        pointStrokeColor : pointStrokeColor
      available:
        fillColor : "rgba(215,216,216,1)"
        strokeColor : "rgba(220,220,220,0)"
        pointColor : "rgba(220,220,220,1)"
        pointStrokeColor : pointStrokeColor
      staff:
        fillColor : "rgba(188,188,188,1)"
        strokeColor : "rgba(255,255,255,0)"
        pointColor : "rgba(151,187,205,1)"
        pointStrokeColor : pointStrokeColor
      unavailable:
        fillColor : "rgba(110,215,246,1)"
        strokeColor : "rgba(255,255,255,1)"
        pointColor : "rgba(151,187,205,1)"
        pointStrokeColor : pointStrokeColor
  ).property()

  chartExists: false
  chartData: (->
    dates = @mapBy('date').map((date) -> Date.parse(date))
    makeLayer = (name, xValues, yValues) ->
      name: name
      startDate: xValues.get('firstObject')
      endDate: xValues.get('lastObject')
      values: xValues.map (xVal, i) ->
        {x: xVal, y: yValues[i]}

    [ makeLayer("billing", dates, @mapBy('billing_count')),
      makeLayer("available", dates, @mapBy('non_billing_count')),
      makeLayer("unavailable", dates, @mapBy('unassignable_count'))
      makeLayer("overhead", dates, @mapBy('overhead_count')),
    ]
  ).property('model.@each')

  actions:
    chartInserted: ->

  chart: App.d3StackChart()
