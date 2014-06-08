Model = require 'models/base/model'
Collection = require 'models/base/collection'

module.exports.Member = class Member extends Model
	urlRoot: '!member'
	idAttribute: '_id'

module.exports.Members = class Members extends Collection
	model: Member
	url: '!member'

