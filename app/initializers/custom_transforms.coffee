RawTransform = DS.Transform.extend
  deserialize: (serialized) ->
    serialized
  serialize: (deserialized) ->
    deserialized


DateTransform = DS.Transform.extend
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


WeightsTransform = DS.Transform.extend
  deserialize: (weights) ->
    result = []
    # use 'percentage' instead of 'percent' because
    # our broke-ass Handlebars thinks `this.percent` should
    # invoke the `percent` helper, FFS. Fixed in 1.3
    for name, percent of weights
      obj = Ember.Object.create { name: name, percentage: percent }
      result.pushObject(obj)
    result

initializer =
  name: 'customTransforms'
  after: 'transforms'
  initialize: (container, application) ->
    application.register('transform:date', DateTransform)
    application.register('transform:raw', RawTransform)
    application.register('transform:weights', WeightsTransform)

`export default initializer`
