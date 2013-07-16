Ember.Application.initializer
  name: 'ajaxInitializer',

  initialize: (container, application) ->
    $.ajaxSetup beforeSend: (xhr) ->
      xhr.setRequestHeader("x-Requested-With", "XMLHTTPRequest")
