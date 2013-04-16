exec = require("child_process").exec
express = require("express")
app = express()

port = parseInt(process.argv[2])
url = process.argv[3]

options = {}

app.get "*", (req, res) ->
  if req.route.params[0]
    exec "phantomjs ./runner.coffee #{url}#{req.route.params[0]}", options, (error, stdout, stderr) ->
      res.send(stdout)
  else
    res.send('need url')

app.listen port

console.log('Listening on ' + port + '...')
console.log('Press Ctrl+C to stop.')
