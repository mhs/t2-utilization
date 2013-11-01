App.ApplicationController = Ember.Controller.extend
  navUrl:(->
    window.ENV.apiHost + "/api/v1/navbar"
  ).property()

