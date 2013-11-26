App.UtilizationChartController = Ember.ArrayController.extend
  needs: ['office']
  chartData: (->
    dates = @mapBy('date').map((date) -> Date.parse(date))
    makeLayer = (name, xValues, yValues) ->
      name: name
      startDate: xValues.get('firstObject')
      endDate: xValues.get('lastObject')
      values: xValues.map (xVal, i) ->
        {x: xVal, y: yValues[i]}

    available_counts = @map (e) ->
      e.get('billable_count') - e.get('unassignable_count')

    data =
      snapDate: @get('controllers.office.formattedSnapDate')
      layers:
        [ makeLayer("billing", dates, @mapBy('billing_count')),
          makeLayer("available", dates, available_counts),
          makeLayer("unavailable", dates, @mapBy('unassignable_count'))
          makeLayer("overhead", dates, @mapBy('overhead_count')),
        ]
  ).property('model.@each')

  chart: App.d3StackChart()
