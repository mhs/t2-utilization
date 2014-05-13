D3StackChartComponent = Ember.Component.extend
  classNames: ["stack-chart"]

  didInsertElement: ->
    Ember.run.once @, 'update'
    $(window).on 'resize', =>
      Ember.run.debounce @, @update, 100

  update: (->
    d3.select(@$()[0])
      .data([ @get('chartData') ])
      .call(@get('chart'), @)
  ).observes('chartData')

`export default D3StackChartComponent`
