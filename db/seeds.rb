# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create!([
  {name: "Technology"},
  {name: "Art"},
  {name: "Music"},
  {name: "Sports"},
  {name: "Film"},
])

20.times do |n|
  Project.create!(name: "Cool project #{n}", category: categories.sample)
end


User.create!(first_name: "Testy", last_name: "McTest", email: "test@test.test", password: "test")