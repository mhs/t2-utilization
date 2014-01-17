App.ListTabComponent = Ember.Component.extend
  item: null
  tagName: 'li'

  classNameBindings: ['active']

  active:  (->
    @get('item.selected')
  ).property('item.selected')

  click: (evt) ->
    @sendAction('select', @get('item'))

  mouseEnter: (evt) ->
    @sendAction('enter', @get('item'))

  mouseLeave: (evt) ->
    @sendAction('leave', @get('item'))
