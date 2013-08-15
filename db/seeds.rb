# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

john = User.create(email: "john@ts.com", password: 12345678, password_confirmation: 12345678,admin: false)
mike = User.create(email: "mike@ts.com", password: 12345678, password_confirmation: 12345678,admin: false)
stial = User.create(email: "stial@ts.com", password: 12345678, password_confirmation: 12345678,admin: false)
admin = User.create(email: "admin@ts.com", password: 12345678, password_confirmation: 12345678,admin: true)
category = []
category[0] = Category.create(name: 'Art')
category[1] = Category.create(name: 'Comics')
category[2] = Category.create(name: 'Desing')
category[3] = Category.create(name: 'Fashion')
category[4] = Category.create(name: 'Film')

city=[]
city[1] = "Colima"
city[2] = "Guadalajara"
city[3] = "Michoacan"
city[4] = "DF"



description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
#Create Project
for x in (0..4) 
  Project.create(user_id: john.id ,name: "Oscar Project #{x}", city: city[x], close_date: Time.now + x.days, description: description, amount: x*1000, money_raised: x*100, video_url: File.open(File.join(Rails.root, "/db/fixtures/videos/out-#{x}.ogv")),category_id: category[x].id, approved: true)
  Project.create(user_id: mike.id ,name: "Mike Project #{x}", city: city[x], close_date: Time.now + x.days, description: description, amount: x*1000, money_raised: x*100, video_url: File.open(File.join(Rails.root, "/db/fixtures/videos/out-#{x}.ogv")),category_id: category[x].id, approved: true)
  Project.create(user_id: stial.id ,name: "Stial Project #{x}", city: city[x], close_date: Time.now + x.days, description: description, amount: x*1000, money_raised: x*100, video_url: File.open(File.join(Rails.root, "/db/fixtures/videos/out-#{x}.ogv")),category_id: category[x].id, approved: true)
end



