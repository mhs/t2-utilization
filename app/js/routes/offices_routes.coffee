
App.OfficesRoute = Ember.Route.extend
  model: ->
    @store.push 'office',
      id: 1000
      name: 'Overview'
      slug: 'overview'

    @store.find('office')

App.getOfficeSummary = (slugName, params) ->
    offices = @modelFor('offices')
    office = offices.findProperty('slug', slugName)

    if !params.snap_date
      snap_date = moment(Date.now()).format("MMMM DD, YYYY")
    else
      snap_date = params.snap_date

    if office.get('slug') == 'overview'
      officeId = null
    else
      officeId = office.get('id')
    @store.find('utilizationSummary', {office_id: officeId, snap_date: snap_date})

App.OfficesIndexRoute = Ember.Route.extend
  model:(params) ->
    slugName = @controllerFor('authentication').get('currentUser').office_slug
    App.getOfficeSummary.call(@, slugName, params)

  redirect: (model) ->
    @transitionTo 'office', model


App.OfficeRoute = Ember.Route.extend


  model: (params) ->
    slugName = params.office_name
    App.getOfficeSummary.call(@, slugName, params)

  setupController: (controller, model) ->
    offices = @modelFor('offices')
    model = model.get('firstObject')
    controller.set('model', offices.findProperty('slug', model.get('officeSlug')))

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
