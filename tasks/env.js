module.exports = function(grunt) {
  grunt.registerMultiTask("env", "load enviroment variables", function() {
    var path = "app/js/env.coffee";
    grunt.file.write(path, getENV(this.data));
  });

  function getENV(data) {
    return "window.ENV = " + JSON.stringify(data) + "\n";
  };
};
