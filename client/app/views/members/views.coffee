View = require 'views/base/view'

module.exports.MembersMainView = class MembersMainView extends View
	template: require 'views/members/main'
	autoRender: true

module.exports.NewMemberView = class NewMemberView extends View
	template: require 'views/members/new'
	autoRender: true