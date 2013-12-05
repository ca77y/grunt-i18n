path = require 'path'

module.exports = (grunt) ->
  grunt.registerMultiTask 'i18n', 'Localize Grunt templates', ->
    options = @options
      locales: []
      output: '.'
      base: ''

    grunt.verbose.writeflags options, 'Options'

    for templatePath in @filesSrc
      if not grunt.file.isFile templatePath
        grunt.fail.warn("#{templatePath} is not a file.")

      localePaths = grunt.file.expand options.locales
      for localePath in localePaths
        outputPath = generateOutputPath templatePath, localePath, options
        template = translateTemplate templatePath, localePath, options
        grunt.verbose.writeln "Translating '#{templatePath}' with locale '#{localePath}' to '#{outputPath}'."
        grunt.file.write outputPath, template

  translateTemplate = (templatePath, localePath, options) ->
    template = grunt.file.read templatePath
    if /(\.yaml|\.yml)$/.test( localePath ) 
      locale = grunt.file.readYAML localePath
    else
      locale = grunt.file.readJSON localePath
    templateOptions = data: locale
    templateOptions.delimiters = options.delimiters if options.delimiters
    grunt.template.process template, templateOptions

  generateOutputPath = (templatePath, localePath, options) ->
    localeFolder = path.basename localePath, path.extname localePath
    filePath = templatePath.slice options.base.length if grunt.util._.startsWith templatePath, options.base
    trimmedFilePath = grunt.util._.trim filePath, '/'
    [options.output, localeFolder, trimmedFilePath].join '/'

  return @