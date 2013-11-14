App.UtilizationSummary = DS.Model.extend
  snapshot: DS.belongsTo 'snapshot'
  utilizationCounts: DS.hasMany 'utilizationCount'
  officeId: DS.attr 'number'
  officeName: DS.attr 'string'
  officeSlug: DS.attr 'string'
