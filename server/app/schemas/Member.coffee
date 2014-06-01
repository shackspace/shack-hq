mongoose = require 'mongoose'
Schema = mongoose.Schema

schema = new Schema
	#_id: ObjectId
	name: String
	firstName: String
	email: String
	birthdate: Date
	phone: String

	adress:
		street: String
		zip: String
		city: String

	fee: Number
	bankingInformation:
		holder: String
		accountNumber: String
		blz: String
		iban: String
		bic: String

# - eintritt
# - austritt
# - schritflich_gekuendigt
# - kuendigung_bestaetigt
# - ML_m
# - ML_m-a
# - ML_key
# - MLsub
# - beitragsart
# - beitragsart_text
# - zahlweise
# - zahlweise_text
# - ls_aktiv
# - reliable
# - beitrag
# - mahn
# - mahnbetrag
# - mahn1datum
# - mahn2datum
# - mahn3datum
# - mahndeadline
# - mahnstatus
# # - geschlecht
# - nickname

module.exports = schema