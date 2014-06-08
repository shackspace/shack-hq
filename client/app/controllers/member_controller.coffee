Controller = require 'controllers/base/controller'
{MembersMainView, NewMemberView} = require 'views/members/views'
{Member} = require 'models/member'
Header = require 'models/header'
HeaderView = require 'views/header_view'


module.exports = class MemberController extends Controller
	beforeAction: ->
		super
		headerModel = new Header()
		@reuse 'header', HeaderView,
			region: 'header'
			model: headerModel

	index: ->
		@view = new MembersMainView region: 'main'

	new: ->
		@view = new NewMemberView region: 'main'
		@view.on 'new', (data) =>
			member = new Member data
			console.log member
			member.save {},
				success: ->
					console.log member
				error: (model, err) ->
					console.error err
