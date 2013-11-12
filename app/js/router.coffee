App.Router.map ->
  @resource 'snapshots', ->
    @resource 'snapshot', {path: '/:snapshot_id'}

App.ApplicationRoute = Ember.Route.extend
  beforeModel: (transition) ->
    auth = @controllerFor('authentication')
    if !auth.get('isAuthenticated')
      transition.abort()
      auth.redirectToSignIn()

  model: ( ->
    url = window.ENV.apiHost + window.ENV.navBarUrl
    $.getJSON(url, {}, (data, status, xhr) ->
      top_nav = data.top
      bottom_nav = data.bottom
      $.each top_nav, (idx, entry) ->
        new_entry = $('<a/>').attr('href', entry.url).attr('title', entry.title).html(
          $('<span/>').addClass('icon').html(entry.icon).after($('<strong/>').html(entry.link_text))
        )
        $('.navigation-frame nav.primary .top-content').append(new_entry)

      $.each bottom_nav, (idx, entry) ->
        new_entry = $('<a/>').attr('href', entry.url).attr('title', entry.title).html(
          $('<span/>').addClass('icon').html(entry.icon).after($('<strong/>').html(entry.link_text))
        )
        $('.navigation-frame nav.primary .bottom-content').prepend(new_entry)
    )
  )
