parsers = require './parsers'

module.exports = (grunt) ->
  grunt.registerMultiTask 'i18n', 'Localize Grunt templates', ->
    options = @options
      locales: []
      output: '.'
      base: ''
      format: 'json'

    grunt.verbose.writeflags options, 'Options'
    parser = if options.parser then options.parser else parsers(grunt)[options.format]

    for templatePath in @filesSrc
      if grunt.file.isFile templatePath
        localePaths = grunt.file.expand options.locales
        for localePath in localePaths
          locale = parser.resolveLocale localePath
          outputPath = generateOutputPath templatePath, locale, options

          localeData = parser.readLocaleData localePath
          template = translateTemplate templatePath, localeData, options

          grunt.verbose.writeln "Translating '#{templatePath}' with locale '#{localePath}' to '#{outputPath}'."
          grunt.file.write outputPath, template

  translateTemplate = (templatePath, localeData, options) ->
    template = grunt.file.read templatePath
    templateOptions =
      data: localeData
    templateOptions.delimiters = options.delimiters if options.delimiters
    grunt.template.process template, templateOptions

  generateOutputPath = (templatePath, locale, options) ->
    filePath = templatePath.slice options.base.length if grunt.util._.startsWith templatePath, options.base
    trimmedFilePath = grunt.util._.trim filePath, '/'
    [options.output, locale, trimmedFilePath].join '/'

  return @
