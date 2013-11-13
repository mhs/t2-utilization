App.SnapshotsController = Ember.ArrayController.extend
  sortProperties: ['snapDate']
  sortAscending: false
  snapshots: (->
    this.get("content")
  ).property("content")

App.SnapshotController = Ember.ObjectController.extend()
