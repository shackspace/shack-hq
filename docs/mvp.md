
# Minimal Prototype

Since the typical hacker can't concentrate on one project for more than approx. seven minutes and has no patience at all, we'll start with a rapid, minimal prototype, and then probably throw it out of the window.

## Structure

Members have:
  - name, email, address, etc.
  - one fees account (Beitragskonto)
  - one donation account

## Behaviour

Members are managed through the ui (create, read, update, delete).

The accounts are synced through either an online banking interface or by importing a file with banking data.

Membership fees are subtracted automatically from the fees account every month.

A file with unpaid accounts and its members can be exported.

The current member base will be imported by ods/csv.

"Mahnstatus" will be tracked.

### Security

Simple user accounts with username and passwords. Every user can access all features.
When not logged in, redirect to login page.

### ods import structure

id	name	vorname	eintritt	austritt	schritflich_gekuendigt	kuendigung_bestaetigt	email	ML_m	ML_m-a	ML_key	MLsub	beitragsart	beitragsart_text	zahlweise	zahlweise_text	ls_aktiv	reliable	beitrag	mahn	mahnbetrag	mahn1datum	mahn2datum	mahn3datum	mahndeadline	mahnstatus	blz	konto	kontoinhaber	strasse	plz	ort	geburtsdatum	geschlecht	telefon	nickname