page = require('webpage').create()
system = require('system')

if system.args.length != 2
    console.log('Usage: phantomjs runner.coffee <some URL>')
    phantom.exit()
else
  page.onLoadFinished = ->
    console.log page.content
    phantom.exit()

  page.open system.args[1]
