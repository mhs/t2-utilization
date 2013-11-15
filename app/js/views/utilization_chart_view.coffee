App.UtilizationChartView = Ember.View.extend
  didInsertElement: ->
    @get('controller').send('chartInserted')
