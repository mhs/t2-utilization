App.D3StackChartComponent = Ember.Component.extend
  classNames: ["stack-chart"]

  didInsertElement: ->
    Ember.run.once @, 'update'
    @bindWindowResize()

  resizeTimer: null

  bindWindowResize: =>
    $(window).on 'resize', =>
      window.clearTimeout(@resizeTimer)
      @resizeTimer = setTimeout( @update, 100)
      true

  update: (->
    console.log "Update chart"
    d3.select(@$()[0])
      .data([ @get('chartData') ])
      .call(@get('chart'))
  ).observes('chartData')

