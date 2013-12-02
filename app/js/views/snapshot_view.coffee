App.SnapshotView = Ember.View.extend
  click: (evt) ->
    name = $(evt.target).data('filter-name')
    if name
      @get('controller').send('setFilter', name)

  didInsertElement:  ->
    $(@get("element")).on("mouseenter", "li", (evt) =>
      name = $(evt.target).data('filter-name')
      @get('controller').send('chartHighlight', name)
      console.log name
      )
    $(@get("element")).on("mouseleave", "li", (evt) =>
      @get('controller').send('chartHighlight', null)
      )


