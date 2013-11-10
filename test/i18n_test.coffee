grunt = require 'grunt'

exports.i18n =
  happyPath: (test) ->
    test.expect 4

    expected = grunt.file.read 'test/expected/en_US/test.tpl.html'
    actual = grunt.file.read 'tmp/en_US/test.tpl.html'
    test.equal expected, actual, 'should translate a template to english'

    expected = grunt.file.read 'test/expected/pl_PL/test.tpl.html'
    actual = grunt.file.read 'tmp/pl_PL/test.tpl.html'
    test.equal expected, actual, 'should translate a template to polish'

    expected = grunt.file.read 'test/expected/en_US/test.tpl.html'
    actual = grunt.file.read 'tmp/en_US/test-custom-delimiters.tpl.html'
    test.equal expected, actual, 'should translate a template with custom delimiters to english'

    expected = grunt.file.read 'test/expected/pl_PL/test.tpl.html'
    actual = grunt.file.read 'tmp/pl_PL/test-custom-delimiters.tpl.html'
    test.equal expected, actual, 'should translate a template with custom delimiters to polish'

    test.done()