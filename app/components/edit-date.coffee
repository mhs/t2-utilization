EditDateComponent = Ember.TextField.extend
  classNames: ["datepicker"]
  readonly: true

  didInsertElement: ->
    currentYear = (new Date()).getFullYear()
    picker = new Pikaday
      field: @$()[0]
      format: 'YYYY-MM-DD'
      yearRange: [currentYear-3, currentYear+3]
      onSelect: => @sendAction('dateSelected', picker.toString())

`export default EditDateComponent`
