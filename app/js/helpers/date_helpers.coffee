Ember.Handlebars.registerBoundHelper 'date', (date) ->
  if !date
    return 'OMGWTFBBQ';
  moment(date).format("MMMM DD, YYYY")
