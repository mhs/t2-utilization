ListTabComponent = Ember.Component.extend
  item: null
  tagName: 'li'

  classNameBindings: ['active']

  active:  (->
    @get('item.selected')
  ).property('item.selected')

  click: (evt) ->
    @sendAction('select', @get('item'))
    false

  mouseEnter: (evt) ->
    @sendAction('enter', @get('item'))
    false

  mouseLeave: (evt) ->
    @sendAction('leave', @get('item'))
    false

`export default ListTabComponent`
