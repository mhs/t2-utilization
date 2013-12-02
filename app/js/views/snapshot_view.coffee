App.SnapshotView = Ember.View.extend
  click: (evt) ->
    name = $(evt.target).data('filter-name')
    if name
      @get('controller').send('setFilter', name)

  mouseEnter: (evt) ->
    name = $(evt.target).data('filter-name')
    if name
      @get('controller').send('chartHighlight', name)
  mouseLeave: (evt) ->
    console.log "leaving #{evt.target}"

