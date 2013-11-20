App.D3StackChartComponent = Ember.Component.extend
  classNames: ["stack-chart"]

  didInsertElement: ->
    Ember.run.once @, 'update'
    $(window).on 'resize', =>
      Ember.run.debounce @, @update, 100


  update: (->
    console.log "Update chart"
    d3.select(@$()[0])
      .data([ @get('chartData') ])
      .call(@get('chart'))
  ).observes('chartData')

