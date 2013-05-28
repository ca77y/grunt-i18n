module.exports = (grunt) ->
    grunt.registerMultiTask 'i18n', 'Localize Grunt templates', () ->
        options = @options
            locales: []
            output: '.'
            base: ''

        grunt.verbose.writeflags options, 'Options'

        @filesSrc.forEach (filepath) ->
            locales = grunt.file.expand options.locales
            for localepath in locales
                translateTemplates filepath, localepath, options

    translateTemplates = (filepath, localpath, options) ->
        fileContent = grunt.file.read filepath
        localContent = grunt.file.readJSON localpath
        localizedTemplate = grunt.template.process fileContent, {data: localContent.data}
        outputpath = generateOutputPath localContent.options.outputFolder, filepath, options
        grunt.file.write outputpath, localizedTemplate

    generateOutputPath = (localeFolder, filepath, options) ->
        filepath = filepath.slice options.base.length if grunt.util._.startsWith filepath, options.base
        filepath = grunt.util._.trim filepath, '/'
        [options.output, localeFolder, filepath].join '/'