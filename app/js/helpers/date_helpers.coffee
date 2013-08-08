Ember.Handlebars.registerBoundHelper 'date', (date) ->
  moment(Date(date)).format("MMMM DD, YYYY")
