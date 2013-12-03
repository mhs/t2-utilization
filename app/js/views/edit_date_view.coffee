App.EditDateView = Ember.TextField.extend
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

# The helper has to be registered here rather than in
# a separate file to ensure that it loads after the
# EditDateView is defined.
Ember.Handlebars.helper('edit-date', App.EditDateView)
