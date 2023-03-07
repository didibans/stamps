# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed file for gastronomy shops database
require 'faker'

# Create some users
10.times do
  User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    profile_image_url: Faker::Avatar.image,
    qr_code_id: Faker::Number.unique.between(from: 1000, to: 9999)
  )
end

# Create some shops
restaurant_names = ["The French Connection", "Mediterranean Bistro", "Sushi Palace", "The Steakhouse", "Bakery Delights", "Coffee House", "The Tavern", "The Pub", "Café du Monde", "Café Brasil"]

10.times do
  Shop.create!(
    name: restaurant_names(1..10), # Faker::Restaurant.name,
    category: Faker::Restaurant.type,
    address: Faker::Address.full_address,
    image_url: Faker::Company.logo,
    user_id: Faker::Number.between(from: 1, to: 10)
  )
end
