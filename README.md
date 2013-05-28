# grunt-i18n

> Internationalization support for grunt.

## Getting started
This plugin requires Grunt `~0.4.0`

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

Path to localization files. Please check the examples in tests. Glob patterns can be used.

#### output
Type: String

Root output folder.

#### base
Type: String

Base folder for HTML templates which should not be preserved while translating. Please check the tests if you don't get it ;)

## Release History
* 2013-05-28   v0.1.0   Initial release, not really useful for anybody except me ;)