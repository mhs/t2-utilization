Ember.Handlebars.registerBoundHelper 'date', (date) ->
  moment(date).format("MMMM DD, YYYY")
