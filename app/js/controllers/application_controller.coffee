App.ApplicationController = Ember.Controller.extend
  navUrl:(->
    window.ENV.apiHost + "/navbar"
  ).property()

