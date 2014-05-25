express = require 'express'
path = require 'path'
fs = require 'fs'
favicon = require 'static-favicon'
logger = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
lessMW = require 'less-middleware'
coffeeMW = require 'coffee-middleware'

module.exports = app = express()

app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'

app.use favicon()
app.use '/s', express.static path.join __dirname, 'bower_components'
app.use '/css', lessMW path.join(__dirname, 'public', 'less'),
	dest: path.join(__dirname, 'public', 'css')
app.use '/js', coffeeMW
	src: path.join __dirname, 'public', 'coffee'
	dest: path.join __dirname, 'public', 'js'
	compress: true
app.use express.static path.join __dirname, 'public'
app.use logger 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded()
app.use cookieParser()

require('./routes/index').init app
require('./routes/users').init app

# catch 404 and forward to error handler
app.use (req, res, next) ->
  err = new Error 'Not Found'
  err.status = 404
  next(err)

# error handlers
app.use (err, req, res, next) ->
  res.status err.status || 500
  res.render 'error',
    message: err.message,
    error: err

do (data = '' + process.pid) ->
  process.argv[0] = '[my-app]'
  fs.writeFileSync '/home/mati/my-app.pid',
    data