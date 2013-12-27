grunt = require 'grunt'

exports.i18n =
  should_translate_regular_grunt_templates: (test) ->
    test.expect 2

    expected = grunt.file.read 'test/expected/en_US/test.tpl.html'
    actual = grunt.file.read 'tmp/json/en_US/test.tpl.html'
    test.equal expected, actual, 'should translate a template to english'

    expected = grunt.file.read 'test/expected/pl_PL/test.tpl.html'
    actual = grunt.file.read 'tmp/json/pl_PL/test.tpl.html'
    test.equal expected, actual, 'should translate a template to polish'

    test.done()

  should_translate_grunt_templates_with_custom_delimiters: (test) ->
    test.expect 2

    expected = grunt.file.read 'test/expected/en_US/test.tpl.html'
    actual = grunt.file.read 'tmp/custom/en_US/test-custom-delimiters.tpl.html'
    test.equal expected, actual, 'should translate a template with custom delimiters to english'

    expected = grunt.file.read 'test/expected/pl_PL/test.tpl.html'
    actual = grunt.file.read 'tmp/custom/pl_PL/test-custom-delimiters.tpl.html'
    test.equal expected, actual, 'should translate a template with custom delimiters to polish'

    test.done()

  should_translate_regular_grunt_templates_with_yaml_locale: (test) ->
    test.expect 2

    expected = grunt.file.read 'test/expected/en_US/test.tpl.html'
    actual = grunt.file.read 'tmp/yaml/en_US/test.tpl.html'
    test.equal expected, actual, 'should translate a template to english (with YAML locale)'

    expected = grunt.file.read 'test/expected/pl_PL/test.tpl.html'
    actual = grunt.file.read 'tmp/yaml/pl_PL/test.tpl.html'
    test.equal expected, actual, 'should translate a template to polish (with YAML locale)'

    test.done()

  should_translate_regular_grunt_templates_with_transifex_locale: (test) ->
    test.expect 2

    expected = grunt.file.read 'test/expected/en_US/test.tpl.html'
    actual = grunt.file.read 'tmp/transifex/en_US/test.tpl.html'
    test.equal expected, actual, 'should translate a template to English with locale from Transifex'

    expected = grunt.file.read 'test/expected/pl_PL/test.tpl.html'
    actual = grunt.file.read 'tmp/transifex/pl_PL/test.tpl.html'
    test.equal expected, actual, 'should translate a template to Polish with locale from Transifex'

    test.done()
