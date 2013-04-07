phantom = require("phantom")
express = require("express")
app = express()

port = parseInt(process.argv[2])
url = process.argv[3]

app.get "*", (req, res) ->
  phantom.create (ph) ->
    ph.createPage (page) ->

      console.log "#{url}#{req.route.params[0]}"

      page.set 'onCallback', (content)->
        res.end content
        ph.exit()

      page.set 'onInitialized', ->
        page.evaluate ->
          document.addEventListener(
            '__htmlReady__',
            (-> window.callPhantom(document.getElementsByTagName('html')[0].outerHTML)),
            false
          )

      page.open "#{url}#{req.route.params[0]}"

    , { parameters: { 'disk-cache': 'no', 'load-images': false, 'local-to-remote-url-access': true } }

app.listen(port)
console.log('Listening on ' + port + '...')
console.log('Press Ctrl+C to stop.')
