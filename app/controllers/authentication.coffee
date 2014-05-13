AuthenticationController = Ember.ObjectController.extend
  init: -> @set('accessToken', localStorage.accessToken)

  accessToken: null

  isAuthenticated: Ember.computed.notEmpty('accessToken')

  redirectToSignIn: ->
    @_redirectTo "/sign_in"

  logout: ->
    @set('accessToken', null)
    @_redirectTo "/sign_out"

  extractAccessToken: ->
    match = location.href.match(/authentication_token=([a-zA-Z0-9_-]+)/)
    if (match)
      @set('accessToken', match[1])
      location.href = location.origin

  accessTokenChanged: (->
    token = @get('accessToken')

    if (token)
      localStorage.accessToken = token
    else
      delete localStorage.accessToken
  ).observes("accessToken")

  currentUser: (->
    person = {}
    Ember.$.ajax({
      # ASYNC MY BALLS
      async: false,
      url: "#{window.ENV.apiHost}/api/v1/profile.json",
      dataType: 'json',
      data: {},
      success: (data) ->
        person = data.person
      }
    )
    person
  ).property('accessToken')

  _redirectTo: (url) ->
    uri = window.ENV.apiHost + url
    uri += "?return_url=" + escape(location.href)
    location.href = uri


`export default AuthenticationController`
