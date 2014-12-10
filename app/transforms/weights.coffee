`import DS from "ember-data";`

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

`export default WeightsTransform`
