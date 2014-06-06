assert = require 'assert'
should = require 'should'
mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/shack-hq'
User = require '../app/schemas/User'
{spawn, exec} = require 'child_process'

describe 'passport', =>
	before ->
		newUser = new User()
		newUser.save {name: 'test', password:'test'}, (err, user) ->
			if !err
				console.log 'saved #{user.test}'
	after ->
		User.remove {name: 'test'}, (err) ->
			if err
				console.log 'error while removing test user'
	
	describe 'loginValidation', ->
		it 'should validate the user without problem', (done) ->
			curl = spawn 'curl', ['--data', 'username=test&password=secret', 'http://localhost:9000/login', '--noproxy localhost']
			curl.stdout.should.be.equal 'Accepted'
			done()

		it 'should not validate invalid users', (done) ->
			curl = spawn 'curl', ['--data', 'username=test&password=secrest', 'http://localhost:9000/login', '--noproxy localhost']
			curl.stdout.should.be.equal 'Forbidden'
			done()
