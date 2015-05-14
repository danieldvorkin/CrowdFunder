# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.destroy_all
Pledge.destroy_all
Project.destroy_all
Reward.destroy_all

categories = Category.create!([
 {name: "Technology"},
 {name: "Art"},
 {name: "Music"},
 {name: "Sports"},
 {name: "Film"},
])

40.times do |n|
  proj = Project.create!(
  	name: Faker::Commerce.product_name,
  	description: Faker::Lorem.sentence,
  	funding_goal: rand(0..10000000),
  	image: Faker::Avatar.image,
  	category: categories.sample
  )
  print '/'

  6.times do |i|  
    proj.rewards.create!(
      title: Faker::Company.name,
      description: Faker::Lorem.sentence,
      amount: rand(0..10000),
      project_id: rand(1...20)
      )
    print '-'
  end
end

