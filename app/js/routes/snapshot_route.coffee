App.SnapshotRoute = Ember.Route.extend
  events:
    selectTab: (name) ->
      @controllerFor('snapshot').set('activeTab', name)
      @render name,
        into: 'snapshot', outlet: 'tab'

  setupController: (controller) ->
    controller.set 'activeTab', 'staff'

  renderTemplate: ->
    @render()
    @render 'staff', outlet: 'tab', into: 'snapshot'
