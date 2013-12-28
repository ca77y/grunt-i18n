path = require 'path'

class DefaultParser
  parse: (locale)->
    locale

# locales from Transifex have one property to name the particular locale, with the
# translations all below that. E.G. { "en": {"message": "Hello, world!"} }
class TransifexParser
  parse: (locale)->
    keys = Object.keys locale
    if keys.length is 1 and typeof locale[keys[0]] is 'object'
      locale[keys[0]]
    else
      locale

parsers =
  'default': new DefaultParser()
  transifex: new TransifexParser()

module.exports = (grunt) ->
  grunt.registerMultiTask 'i18n', 'Localize Grunt templates', ->
    options = @options
      locales: []
      output: '.'
      base: ''
      format: 'default'

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
    if /(\.yaml|\.yml)$/.test(localePath)
      localeFileContent = grunt.file.readYAML localePath
    else
      localeFileContent = grunt.file.readJSON localePath

    parser = parsers[options.format]
    locale = parser.parse localeFileContent

    templateOptions =
      data: locale
    templateOptions.delimiters = options.delimiters if options.delimiters
    grunt.template.process template, templateOptions

  generateOutputPath = (templatePath, localePath, options) ->
    localeFolder = path.basename localePath, path.extname localePath
    filePath = templatePath.slice options.base.length if grunt.util._.startsWith templatePath, options.base
    trimmedFilePath = grunt.util._.trim filePath, '/'
    [options.output, localeFolder, trimmedFilePath].join '/'

  return @
