passport = require 'passport'
User = require '../schemas/User'

exports.postLogin = (req, res, next) ->
	`passport.authenticate('local', function(err, user, info) {
		if (err) {
			return next(err);   
		}
		if (!user) {
			return res.send(403);
		}
		req.logIn(user, function(err) {
			if (err) {
				return next(err);
			}
			User.findOne({name: user.name}, function(err, user) {
				if (err) {
					next(err);
				}
			});
			return res.send(202);
		});
	}) (req, res, next);`
#	passport.authenticate 'local', (err, user, info) ->
#		console.log(user)
#		if err
#			return next(err)
#		if !user
#			res.send 403
#		req.logIn user, (err) =>
#			if err
#				return next err
#			User.findOne {name: user.name}, (err, user) =>
#				if err
#					next err
#			res.send 202
