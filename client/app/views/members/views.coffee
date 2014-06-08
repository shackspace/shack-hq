View = require 'views/base/view'

module.exports.MembersMainView = class MembersMainView extends View
	template: require 'views/members/main'
	autoRender: true

module.exports.NewMemberView = class NewMemberView extends View
	template: require 'views/members/new'
	autoRender: true

	events:
		'submit form': 'submit'

	submit: (event) =>
		event.preventDefault()
		data =
			name: @$('[name="name"]').val()
			firstName: @$('[name="firstName"]').val()
			nickname: @$('[name="nickname"]').val()
			gender: @$('[name="gender"]:checked').val()
			email: @$('[name="email"]').val()
			birthdate: @$('[name="birthdate"]').val()
			phone: @$('[name="phone"]').val()
			joined: @$('[name="joined"]').val()
			address:
				street: @$('[name="address.street"]').val()
				zip: @$('[name="address.zip"]').val()
				city: @$('[name="address.city"]').val()
			feeInformation:
				reduced: @$('[name="feeInformation.reduced"]:checked').val()
				paymentInterval: @$('[name="feeInformation.paymentInterval"]:checked').val()
				paymentMethod: @$('[name="feeInformation.paymentMethod"]:checked').val()
				fee: @$('[name="feeInformation.fee"]').val()
			bankingInformation:
				holder: @$('[name="bankingInformation.holder"]').val()
				iban: @$('[name="bankingInformation.iban"]').val()
				bic: @$('[name="bankingInformation.bic"]').val()
			mailinglists:
				members: @$('[name="mailinglists.members"]').val()
				announce: @$('[name="mailinglists.announce"]').val()
				key: @$('[name="mailinglists.key"]').val()

		@trigger 'new', data
		return false