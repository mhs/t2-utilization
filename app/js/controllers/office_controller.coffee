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


