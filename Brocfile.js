/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp();

app.import('bower_components/ember-data/ember-data.js');
app.import('bower_components/d3/d3.js');
app.import('bower_components/moment/moment.js');
app.import('bower_components/pikaday/pikaday.js');
app.import('bower_components/pikaday/css/pikaday.css');

app.import('bower_components/ic-ajax/dist/named-amd/main.js', {
  'ic-ajax': [
  'default',
  'defineFixture',
  'lookupFixture',
  'raw',
  'request',
  ]
});

module.exports = app.toTree();
