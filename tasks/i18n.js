var path;

path = require('path');

module.exports = function(grunt) {
  var generateOutputPath, translateTemplates;
  grunt.registerMultiTask('i18n', 'Localize Grunt templates', function() {
    var filepath, localePath, localePaths, options, _i, _len, _ref, _results;
    options = this.options({
      locales: [],
      output: '.',
      base: ''
    });
    grunt.verbose.writeflags(options, 'Options');
    _ref = this.filesSrc;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      filepath = _ref[_i];
      localePaths = grunt.file.expand(options.locales);
      _results.push((function() {
        var _j, _len1, _results1;
        _results1 = [];
        for (_j = 0, _len1 = localePaths.length; _j < _len1; _j++) {
          localePath = localePaths[_j];
          _results1.push(translateTemplates(filepath, localePath, options));
        }
        return _results1;
      })());
    }
    return _results;
  });
  translateTemplates = function(templatePath, localePath, options) {
    var locale, localizedTemplate, output, outputFolder, template;
    template = grunt.file.read(templatePath);
    locale = grunt.file.readJSON(localePath);
    localizedTemplate = grunt.template.process(template, {
      data: locale
    });
    outputFolder = path.basename(localePath, path.extname(localePath));
    output = generateOutputPath(outputFolder, templatePath, options);
    grunt.verbose.writeln("Translating '" + templatePath + "' with locale '" + localePath + "' to '" + output + "'");
    return grunt.file.write(output, localizedTemplate);
  };
  generateOutputPath = function(localeFolder, filepath, options) {
    if (grunt.util._.startsWith(filepath, options.base)) {
      filepath = filepath.slice(options.base.length);
    }
    filepath = grunt.util._.trim(filepath, '/');
    return [options.output, localeFolder, filepath].join('/');
  };
  return this;
};
