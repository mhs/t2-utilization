App.SnapshotController = Ember.ObjectController.extend
  utilization: (->
    Math.round(100.0 * @get('billing.length') / @get('assignable.length'))
  ).property('billing', 'assignable')
