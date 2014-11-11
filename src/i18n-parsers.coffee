fs = require 'fs'
path = require 'path'
PropertiesReader = require 'properties-reader'

class BaseParser
  constructor: (@grunt) ->

  resolveLocale: (localePath) ->
    path.basename localePath, path.extname localePath


class JsonParser extends BaseParser
  name: 'json'

  readLocaleData: (localePath) ->
    @grunt.file.readJSON localePath

"""
Locales from Transifex have one property to name the particular locale, with the
translations all below that. E.G. { "en": {"message": "Hello, world!"} }
"""
class TransifexParser extends JsonParser
  name: 'transifex'

  readLocaleData: (localePath) ->
    data = super
    keys = Object.keys data
    if keys.length is 1 and typeof data[keys[0]] is 'object'
      data[keys[0]]
    else
      data

class YamlParser extends BaseParser
  name: 'yaml'

  readLocaleData: (localePath) ->
    @grunt.file.readYAML localePath

class PropertiesParser extends BaseParser
  name: 'properties'

  resolveLocale: (localePath) ->
    (path.extname localePath).substring 1

  readLocaleData: (localePath) ->
    PropertiesReader(localePath).path()

module.exports = (grunt) ->
  jsonParser = new JsonParser(grunt)
  transifexParser = new TransifexParser(grunt)
  yamlParser = new YamlParser(grunt)
  propertiesParser = new PropertiesParser(grunt)

  result = {}
  result[jsonParser.name] = jsonParser
  result[transifexParser.name] = transifexParser
  result[yamlParser.name] = yamlParser
  result[propertiesParser.name] = propertiesParser
  result
