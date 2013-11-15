App.SnapshotView = Ember.View.extend
  click: (evt) ->
    name = $(evt.target).data('filter-name')
    if name
      @get('controller').send('setFilter', name)

