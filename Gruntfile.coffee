module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean: ['tmp', 'lib']

    coffeelint:
      tasks: 'tasks/**/*.coffee'
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

    i18n:
      hello_world:
        src: ['test/fixtures/*.tpl.html']
        options:
          locales: 'test/locales/*'
          output: 'tmp'
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