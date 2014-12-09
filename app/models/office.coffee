`import DS from "ember-data";`

Office = DS.Model.extend
  name: DS.attr('string')
  slug: (->
    @get('name').replace(/\s+/, '-').toLowerCase()
  ).property('name')

`export default Office`
