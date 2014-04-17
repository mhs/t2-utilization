EditDateComponent = Ember.TextField.extend
  classNames: ["datepicker"]
  attributeBindings:['readonly']
  readonly: true
  _picker: null

  didInsertElement: ->
    currentYear = (new Date()).getFullYear()
    picker = new Pikaday
      field: @$()[0]
      format: 'YYYY-MM-DD'
      yearRange: [currentYear-3, currentYear+3]
      onSelect: =>
        picker = @get('_picker')
        @sendAction('dateSelected', picker.toString())
    this.set("_picker", picker)

`export default EditDateComponent`
