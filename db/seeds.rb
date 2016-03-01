# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'vivek',email: 'vivek@live.com',password: '123456',password_confirmation: '123456',role: 2,verified: true)
User.create(name: 'vivek',email: 'vivek@gmail.com',password: '123456',password_confirmation: '123456',role: 1,verified: true)
User.create(name: 'vivek',email: 'vivek@yahoo.com',password: '123456',password_confirmation: '123456',role: 0)
5000.times do |n|
	name=Faker::Name.name
	email="example-#{n+1}@pqr.xyz"
	password="password"
	User.create!(name: name,email: email,password: password,
		password_confirmation:password,verified: true)

end