App.SnapshotView = Ember.View.extend
  activeTab: Ember.computed.alias('controller.activeTab')

  activeTabDidChange: (->
    if @state == 'inDOM'
      @setActiveTab()
  ).observes('activeTab')

  didInsertElement: ->
    @setActiveTab()

  setActiveTab: ->
    $('.active').removeClass('active')
    activeTab = @get('activeTab')
    @$("a[data-tab='%@']".fmt(activeTab)).parent().addClass('active')
