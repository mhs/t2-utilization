`import DS from "ember-data";`

Project = DS.Model.extend
  name: DS.attr('string')
  offices: DS.hasMany('office')

  value: Ember.computed.alias('id')

`export default Project`
