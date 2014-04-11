Percent = ->
  Ember.Handlebars.helper "per-cent", (whole_number) ->
    whole_number.toFixed(0) + "%"

`export default Percent`
