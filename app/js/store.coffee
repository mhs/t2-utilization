App.ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api/v1'
  host: window.ENV.apiHost

App.ApplicationSerializer = DS.ActiveModelSerializer.extend()

App.RawTransform = DS.Transform.extend
  deserialize: (serialized) ->
    serialized
  serialize: (deserialized) ->
    deserialized

App.DateTransform = DS.Transform.extend
  deserialize: (string) ->
    if !string
      null
    else
      [y, m, d] = string.split('-')
      new Date(y, m - 1, d)

  serialize: (date) ->
    if !date
      return null
    moment(date).format('YYYY-MM-DD')

App.WeightsTransform = DS.Transform.extend
  deserialize: (weights) ->
    result = []
    # use 'percentage' instead of 'percent' because
    # our broke-ass Handlebars thinks `this.percent` should
    # invoke the `percent` helper, FFS. Fixed in 1.3
    result.pushObject({ name: name, percentage: percent }) for name, percent of weights
    result
