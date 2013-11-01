App.ApplicationController = Ember.Controller.extend
  navUrl:(->
    window.ENV.apiHost + window.ENV.navBarUrl
  ).property()

