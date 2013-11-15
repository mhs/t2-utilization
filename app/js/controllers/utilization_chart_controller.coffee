App.UtilizationChartController = Ember.ArrayController.extend
  utilizationCounts: (->
    data =
      staff:
        data: @mapBy('staff_count')
      available:
        data: @mapBy('assignable_count')
      billable:
        data: @mapBy('billable_count')
      unavailable:
        data: @mapBy('unassignable_count')
  ).property('model.@each')

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

  actions:
    chartInserted: ->
      @set('chartExists', true)

  chartData: (->
    counts = @get('utilizationCounts')
    styles = @get('chartStyles')
    mergedData = $.extend(true, counts, styles)
    dataSets = []
    dataSets.push(mergedData[key]) for key in Ember.keys(mergedData)
    data =
      labels : ["","","","","","","","","","",""]
      datasets: dataSets
  ).property('utilizationCounts')

  redrawChart: (->
    if @get('chartExists')
      App.drawChart(@get('chartData'), App.chartOptions)
  ).observes('chartData', 'chartExists')
