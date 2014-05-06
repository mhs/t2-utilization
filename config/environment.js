module.exports = function(environment) {
  var ENV = {
    baseURL: '/',
    locationType: 'auto',
    navBarPath: '/api/v1/navbar',
    FEATURES: {
      // Here you can enable experimental featuers on an ember canary build
      // e.g. 'with-controller': true
    },
    APP: {
    }
  };

  if (environment === 'development') {
    // LOG_MODULE_RESOLVER is needed for pre-1.6.0
    ENV.LOG_MODULE_RESOLVER = true;

    ENV.APP.LOG_RESOLVER = true;
    ENV.APP.LOG_ACTIVE_GENERATION = true;
    ENV.APP.LOG_MODULE_RESOLVER = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    ENV.APP.LOG_VIEW_LOOKUPS = true;
    ENV.apiHost = "http://localhost:5000";
  }

  if (environment === 'production') {}

  return ENV;
};
