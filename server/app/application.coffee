log4js = require 'log4js'
logger = log4js.getLogger 'cfd'
logger.setLevel if process.isTest then 'FATAL' else 'INFO'

path = require 'path'
fs = require 'fs'

clientPublic = path.normalize __dirname + '/../../client/public'

express = require 'express'
bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'
expressSession = require 'express-session'

passport = require 'passport'
passportLogic = require './controllers/passport'
userRoutes = require './controllers/userRoutes'
# config = require '../server_config'
mediator = require './mediator'

app = module.exports = express()

# Load db stuff

mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/shack-hq'
global.mongoose = mongoose

Project = mongoose.model 'Member', require('./schemas/Member'), 'members'
User = mongoose.model 'User', require('./schemas/User'), 'users'

# Server config

app.use bodyParser()
app.use cookieParser 'ponies'
app.use expressSession()

app.use passport.initialize()
app.use passport.session()

# app.use log4js.connectLogger log4js.getLogger 'my-project-access'
app.use express.static clientPublic


# app.use express.errorHandler {dumpExceptions: true, showStack:true }

# admin routers
# ModelRouter = require './routers/Model'


# cheap user list
users =
	root:
		username: 'root'
		password: 'password'

app.post '/authenticate', (req, res) ->
	console.log req.body
	passport.authenticate 'local', (err, user, info) =>
		if err
			return next(err)
		if not user
			req.session.message = [info.message]
			return res.send 403
		req.logIn user, (err) =>
			if err
				return next(err)
			User.findOne {name: user.name}, (err, user) =>
				if err and not user?
					next(err)
			return res.json user	

app.post '/login', userRoutes.postLogin

#	if req.body.user?
#		user = users[req.body.user.username]
#		if user? and user.password = req.body.user.password
#			return res.json user
#		res.send 404
#	else
#		if req.session?.user?
#			return req.session.user
#		res.send 401

# Catch all other requests and deliver client files.
app.get '*', (req, res) ->
	res.sendfile path.join clientPublic, 'index.html'

server = app.listen 9000, ->
	logger.info "Express server listening on port %d in %s mode", 9000, app.settings.env

io = require('socket.io').listen server
mediator.init io

# game = new (require './controllers/Game')

# io.sockets.on 'message', (msg) ->
# 	console.log 'message', msg

# io.sockets.on 'connection', (socket) ->
# 	# inject mediator
# 	$emit = socket.$emit
# 	socket.$emit = ->
# 		#args = Array.prototype.slice.call arguments
# 		mediator.emit.apply mediator, arguments
# 		$emit.apply socket, arguments
# # 	new IoRouter socket
