# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

Category.destroy_all
Item.destroy_all

5.times do
  Category.create(title: Faker::Commerce.department(1, true))
end

Category.all.each do |category|
  rand(5..20).times do
    category.items.create(name: Faker::Commerce.product_name, description: Faker::Lorem.paragraph, price: Faker::Commerce.price, inventory: rand(1..100))
  end
end

Item.all.each do |item|
  rand(1..15).times do
    item.reviews.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, rating: rand(1..5))
  end
end
