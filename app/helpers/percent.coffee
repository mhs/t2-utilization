Percent = ->
  Ember.Handlebars.helper "percent", (whole_number) ->
    whole_number.toFixed(0) + "%"

`export default Percent`
