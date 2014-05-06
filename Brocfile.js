/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp({
  name: require('./package.json').name,
  getEnvJSON: require('./config/environment')
});

app.import('vendor/ember-data/ember-data.js');
app.import('vendor/d3/d3.js');
app.import('vendor/moment/moment.js');
app.import('vendor/pikaday/pikaday.js');
app.import('vendor/pikaday/css/pikaday.css');

app.import('vendor/ic-ajax/dist/named-amd/main.js', {
  'ic-ajax': [
    'default',
    'defineFixture',
    'lookupFixture',
    'raw',
    'request',
  ]
});

module.exports = app.toTree();
