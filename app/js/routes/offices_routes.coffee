
App.OfficesRoute = Ember.Route.extend
  model: ->
    @store.find('office')

App.OfficesIndexRoute = Ember.Route.extend
  model:(params) ->
    offices = @modelFor('offices')
    office = offices.findProperty('slug',
    @controllerFor('authentication').get('currentUser').office_slug)
    if !params.snap_date
      snap_date = moment(Date.now()).format("MMMM DD, YYYY")
    else
      snap_date = params.snap_date
    @store.find('utilizationSummary', {office_id: office.get('id'), snap_date: snap_date})
  redirect: (model) ->
    @transitionTo 'office', model


App.OfficeRoute = Ember.Route.extend

  model:(params) ->
    offices = @modelFor('offices')
    office = offices.findProperty('slug', params.office_name)
    if !params.snap_date
      snap_date = moment(Date.now()).format("MMMM DD, YYYY")
    else
      snap_date = params.snap_date
    @store.find('utilizationSummary', {office_id: office.get('id'), snap_date: snap_date})

  setupController: (controller, model) ->
    offices = @modelFor('offices')
    model = model.get('firstObject')
    controller.set('model', offices.findProperty('id', model.get('officeId')))

    @controllerFor('snapshot').set('model', model.get('snapshot'))
    @controllerFor('utilizationChart').set('model', model.get('utilizationCounts'))
    @controllerFor('officeByOffice').set('model', model.get('byOfficeUtilizations'))

  renderTemplate: ->
    @_super(this, arguments) # Run the default renderTemplate logic
    @render 'utilizationChart',
      into: 'office'
      outlet: 'utilizationChart'
      controller: @controllerFor('utilizationChart')

    @render 'snapshot',
      into: 'office'
      outlet: 'snapshot'
      controller: @controllerFor('snapshot')

    @render 'officeByOfficeTable',
      into: 'office'
      outlet: 'officeByOffice'
      controller: @controllerFor('officeByOffice')

  serialize: (model) ->
    office_name: model.get('firstObject.officeSlug')
    snap_date: model.get('firstObject.snapshot.snapDate')
