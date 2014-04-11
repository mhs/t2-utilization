EditDateView = Ember.TextField.extend
  attributeBindings: ['readonly']
  readonly: true
  didInsertElement: ->

  focusIn: (event) ->
    self = @
    @$().datepicker
      dateFormat: 'yy-mm-dd'
      beforeShowDay: $.datepicker.noWeekends
      onClose: (date)->
        self.triggerAction(actionContext: date)

`export default EditDateView`
