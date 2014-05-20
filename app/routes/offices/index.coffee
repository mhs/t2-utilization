getOfficeSummary = (slugName, params) ->
  offices = @modelFor('offices')
  office = offices.findProperty('slug', slugName)

  if !params.snap_date
    snap_date = moment(Date.now()).format("MMMM DD, YYYY")
  else
    snap_date = params.snap_date

  if office.get('slug') == 'company-wide'
    officeId = null
  else
    officeId = office.get('id')
  @store.find('utilizationSummary', {office_id: officeId, snap_date: snap_date})


OfficesIndexRoute = Ember.Route.extend
  model:(params) ->
    slugName = @controllerFor('authentication').get('currentUser').office_slug
    getOfficeSummary.call(@, slugName, params)

  redirect: (model) ->
    @transitionTo 'office', model

`export default OfficesIndexRoute`
