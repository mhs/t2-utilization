App.OfficeController = Ember.ObjectController.extend
  needs: ['offices', 'snapshot']

  officeButtons: (->
    officeButton = (name, slug) =>
      linkPath = "#/offices/#{slug}/#{@get('snapDate')}"
      selected = (name == @get('name'))
      {name: name, selectedOffice: selected, linkPath: linkPath}

    slugs = @get('officeSlugs')
    offices = @get('officeNames').map((name, index) ->
      officeButton(name, slugs[index])
    )

  ).property('officeNames', 'name')

  snapDate: (->
    @get('controllers.snapshot.snapDate')
  ).property('controllers.snapshot.snapDate')

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

  actions:
    editDate: ->
      @set "isEditingDate", true
    confirmDate: (dateValue) ->
      formattedDate = moment(dateValue).format("YYYY-MM-DD")
      @set "isEditingDate", false
      @set "snapDate", formattedDate

      @store.find('utilizationSummary', {office_id: @get("officeQueryId"), snap_date: formattedDate}).then (newModel) =>
        @transitionToRoute 'office', newModel

