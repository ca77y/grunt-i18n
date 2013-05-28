grunt = require 'grunt'

exports.i18n =
    happyPath : (test) ->
        test.expect 2
        
        expected = grunt.file.read 'test/expected/en/test.tpl.html'
        actual = grunt.file.read 'tmp/en/test.tpl.html'
        test.equal expected, actual, 'should translate a template to english'

        expected = grunt.file.read 'test/expected/pl/test.tpl.html'
        actual = grunt.file.read 'tmp/pl/test.tpl.html'
        test.equal expected, actual, 'should translate a template to polish'

        test.done()