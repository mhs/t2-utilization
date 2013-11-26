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

    data =
      snapDate: @get('controllers.office.formattedSnapDate')
      layers:
        [ makeLayer("billing", dates, @mapBy('billing_count')),
          makeLayer("nonbilling", dates, @mapBy('non_billing_count')),
          makeLayer("unavailable", dates, @mapBy('unassignable_count'))
          makeLayer("overhead", dates, @mapBy('overhead_count')),
        ]
  ).property('model.@each')

  chart: App.d3StackChart()
