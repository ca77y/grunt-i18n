grunt = require 'grunt'

exports.i18n =
  should_translate_regular_grunt_templates: (test) ->
    test.expect 2

    expected = grunt.file.read 'test/expected/en_US/test.tpl.html'
    actual = grunt.file.read 'tmp/en_US/test.tpl.html'
    test.equal expected, actual, 'should translate a template to english'

    expected = grunt.file.read 'test/expected/pl_PL/test.tpl.html'
    actual = grunt.file.read 'tmp/pl_PL/test.tpl.html'
    test.equal expected, actual, 'should translate a template to polish'

    test.done()

  should_translate_grunt_templates_with_custom_delimiters: (test) ->
    test.expect 2

    expected = grunt.file.read 'test/expected/en_US/test.tpl.html'
    actual = grunt.file.read 'tmp/en_US/test-custom-delimiters.tpl.html'
    test.equal expected, actual, 'should translate a template with custom delimiters to english'

    expected = grunt.file.read 'test/expected/pl_PL/test.tpl.html'
    actual = grunt.file.read 'tmp/pl_PL/test-custom-delimiters.tpl.html'
    test.equal expected, actual, 'should translate a template with custom delimiters to polish'

    test.done()

  should_translate_regular_grunt_templates_with_yaml_source: (test) ->
    test.expect 2

    expected = grunt.file.read 'test/expected/en_US/test.tpl.html'
    actual = grunt.file.read 'tmp/en_US/test-yaml.tpl.html'
    test.equal expected, actual, 'should translate a template to english (with YAML source)'

    expected = grunt.file.read 'test/expected/pl_PL/test.tpl.html'
    actual = grunt.file.read 'tmp/pl_PL/test-yaml.tpl.html'
    test.equal expected, actual, 'should translate a template to polish (with YAML source)'

    test.done()
