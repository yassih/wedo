# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
c = Category.create([
	{   name: "Grocery"},
	{   name: "Bills"},
	{   name: "Chores"}
	])
10.times do |i|
User.create(email: "email#{i}@gmail.com", password: "password")
end


