# grunt-i18n [![Build Status](https://travis-ci.org/ca77y/grunt-i18n.png)](https://travis-ci.org/ca77y/grunt-i18n)

> Internationalization support for grunt.

## Getting started
This plugin requires Grunt `~0.4.0`

Please note this is a coffeescript task and the sources are located in src folder, javascript is generated.

## i18n task
_Run this task with the `grunt i18n` command._
Task targets, files and options may be specified according to the grunt [Configuring tasks](http://gruntjs.com/configuring-tasks) guide.

This plugin provides a localization mechanism for grunt templates. It was developed as a tool for localizing AngularJS templates during a grunt build process. Since localization is done once during the build there is no performance hit on the application, as oppose to dynamic localization.

### Usage example
Please check the test as they demonstrate the usage pretty well. In short you need localization files and a HTML template/s. As an output you get one translated HTML template/s per localization file.

### Options
Available options to configure the task.

#### locales
Type: String|Array

Path to localization files. Please check the examples in tests. Glob patterns can be used. JSON or YAML format is allowed, /(\.yaml|\.yml)$/ otherwise it's JSON.

#### output
Type: String

Root output folder.

#### base
Type: String

Base folder for HTML templates which should not be preserved while translating. Please check the tests if you don't get it ;)

#### delimiters
Type: String

Custom delimiters name to be used instead of the default `<% %>`. See the [grunt.template documentation](http://gruntjs.com/api/grunt.template) for more details.

## Release History
* 2013-12-06   v0.5.0   Can read locals in yaml format.
* 2013-11-29   v0.4.0   Custom delimiters and localization file existence checks
* 2013-10-23   v0.3.0   Fix for separator in output path. Add logging messages
* 2013-10-22   v0.2.0   Might be useful for others
* 2013-05-28   v0.1.0   Initial release, not really useful for anybody except me ;)