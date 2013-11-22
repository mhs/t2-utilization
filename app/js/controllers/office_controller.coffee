App.OfficeController = Ember.ObjectController.extend
  needs: ['offices', 'snapshot']

  officeButtons: (->
    officeButton = (name, slug) =>
      linkPath = "#/offices/#{slug}/#{@get('formattedSnapDate')}"
      selected = (name == @get('name'))
      {name: name, selectedOffice: selected, linkPath: linkPath}

    slugs = @get('officeSlugs')
    offices = @get('officeNames').map((name, index) ->
      officeButton(name, slugs[index])
    )

  ).property('officeNames', 'name', 'formattedSnapDate')

  snapDate: (->
    @get('controllers.snapshot.snapDate')
  ).property('controllers.snapshot.snapDate')

  formattedSnapDate:((key, string) ->
    if arguments.length >1
      [y, m, d] = string.split('-')
      @set('snapDate', new Date(y, m - 1, d))
    moment(@get('snapDate')).format("YYYY-MM-DD")
  ).property('snapDate')

  officeSlugs: (->
    offices = @get('controllers.offices')
    offices.mapProperty('slug')
  ).property('controllers.offices.@each.slug')

  officeNames: (->
    offices = @get('controllers.offices')
    offices.mapProperty('name')
  ).property('controllers.offices.@each.name')

  isEditingDate: false

  officeQueryId: (->
    if @get('slug') == 'overview' then null else @get('id')
  ).property("slug")

  switchDate: (date) ->
    @set "isEditingDate", false
    # @set "formattedSnapDate", date
    @store.find('utilizationSummary', {office_id: @get("officeQueryId"), snap_date: date}).then (newModel) =>
      @transitionToRoute 'office', newModel

  actions:
    editDate: ->
      @set "isEditingDate", true
    confirmDate: (dateValue) ->
      formattedDate = moment(dateValue).format("YYYY-MM-DD")
      @switchDate(formattedDate)

