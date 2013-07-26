# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

User.create(email: "john@ts.com", password: 12345678, password_confirmation: 12345678)
User.create(email: "mike@ts.com", password: 12345678, password_confirmation: 12345678)
User.create(email: "admin@ts.com", password: 12345678, password_confirmation: 12345678)

Category.create(name: 'Art')
Category.create(name: 'Comics')
Category.create(name: 'Desing')
Category.create(name: 'Fashion')
Category.create(name: 'Film')
Category.create(name: 'Film & Video')
Category.create(name: 'Food')
Category.create(name: 'Games')
Category.create(name: 'Music')
Category.create(name: 'Photography')
Category.create(name: 'Publishing')
Category.create(name: 'Technology')
Category.create(name: 'Theater')
