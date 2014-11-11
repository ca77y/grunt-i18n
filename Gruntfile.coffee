module.exports = (grunt) ->
  grunt.template.addDelimiters('custom', '{%', '%}')

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean: ['tmp', 'lib']

    coffeelint:
      tasks: 'src/**/*.coffee'
      test: 'test/**/*.coffee'
      grunt: 'Gruntfile.coffee'
      options:
        max_line_length:
          value: 120
          level: 'error'
        no_trailing_whitespace:
          level: 'error'
        no_tabs:
          level: 'error'
        indentation:
          value: 2
          level: 'error'

    coffee:
      tasks:
        files:
          'tasks/i18n.js': 'src/i18n.coffee'
      options:
        bare: true
        header: true

    i18n:
      json_format:
        src: ['test/fixtures/test.tpl.html']
        options:
          locales: 'test/locales/json/*'
          output: 'tmp/json'
      json_format_with_custom_delimiters:
        src: ['test/fixtures/test-custom-delimiters.tpl.html']
        options:
          locales: 'test/locales/json/*'
          output: 'tmp/custom'
          delimiters: 'custom'
      yaml_format:
        src: ['test/fixtures/test.tpl.html']
        options:
          locales: 'test/locales/yaml/*'
          output: 'tmp/yaml'
          format: 'yaml'
      json_format_with_transifex:
        src: ['test/fixtures/test.tpl.html']
        options:
          locales: 'test/locales/transifex/*'
          output: 'tmp/transifex'
          format: 'transifex'
      properties_format:
        src: ['test/fixtures/test.tpl.html']
        options:
          locales: 'test/locales/properties/*'
          output: 'tmp/properties'
          format: 'properties'
      custom_parser:
        src: ['test/fixtures/test.tpl.html']
        options:
          locales: 'test/locales/json/*'
          output: 'tmp/custom_parser'
          parser:
            resolveLocale: -> 'en'
            readLocaleData: ->
              message: "Hello world!"
              nested:
                msg: "and hello to you"
      options:
        base: 'test/fixtures'

    nodeunit:
      tests: ['test/*_test.coffee']

  grunt.loadTasks 'src'

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-nodeunit'

  grunt.registerTask 'default', ['clean', 'coffeelint', 'coffee']
  grunt.registerTask 'test', ['clean', 'coffeelint', 'i18n', 'nodeunit']
