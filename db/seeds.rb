require 'faker'

StampCard.destroy_all
StampCardTemplate.destroy_all
Shop.destroy_all
User.destroy_all

10.times do
  User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "123qwe",
    profile_img_url: Faker::Avatar.image,
    qr_code_id: Faker::Number.unique.between(from: 1000, to: 9999)
  )
  puts "#{User.last.username} created..."
end

restaurant_names = ["Burger Joint", "Mediterranean Bistro", "Sushi Bar", "The Steakhouse",
                    "Bakery Delights", "Coffee House", "The Tavern", "The Pub", "Café du Monde", "Café Brasil"]

addresses = [
  "Hohenzollernring 55, 50672 Köln",
  "Ebertplatz 2, 50668 Köln",
  "Im Ferkulum 42, 50678 Köln",
  "Eigelstein 69, 50668 Köln",
  "Hansaring 68-70, 50670 Köln",
  "Apostelnstraße 11, 50667 Köln",
  "Rathenauplatz 2, 50674 Köln",
  "Neusser Straße 41, 50670 Köln",
  "Subbelrather Straße 156, 50823 Köln",
  "Luxemburger Str. 281, 50939 Köln"
]

10.times do |name|
  Shop.create!(
    name: restaurant_names[name], # Faker::Restaurant.name
    category: Faker::Restaurant.type,
    address: addresses[name],
    img_url: Faker::Company.logo,
    user_id: User.all.sample.id
  )
  puts "#{Shop.last.name} created..."
end

dates = [(DateTime.now + 1.year), (DateTime.now + 2.years), (DateTime.now + 5.month), (DateTime.now + 9.months), (DateTime.now + 18.months), (DateTime.now + 3.months)]

StampCardTemplate.create!(
  [
    { title: "One Burger for FREE", description: "Buy 10 burgers, get 1 free!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Burger Joint") },
    { title: "Every 10th coffee on the house", description: "Get a free brazilian coffee after completion!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Café Brasil") },
    { title: "Pizza for free", description: "Get a free pizza with every 10th order!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Mediterranean Bistro") },
    { title: "Omakase experience on the house", description: "Experience our chef's omakase menu and earn a stamp for each course!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Sushi Bar") },
    { title: "Argentinian Steak for free", description: "Experience one free argentinian Steak in our lovely place after completion.", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "The Steakhouse") },
    { title: "Buy 10 drinks, get 1 for free!", description: "Enjoy our drinks and collect a stamp for each!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "The Pub") },
    { title: "Free drink on us", description: "Buy drinks in our Tavern and get a free drink for the 10th!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "The Tavern") },
    { title: "Free Coffee delight", description: "Get every 11th coffee on the house", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Coffee House") },
    { title: "Free loave of bread", description: "Buy 10 loaves of bread, get 1 free!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Bakery Delights") },
    { title: "One Coffee for free", description: "Get a free coffee once completed.", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Café du Monde") }
  ]
)
puts "Created StampCard-Template for each shop..."

# seed_stamp_card = StampCard.create!(stamp_amount: 6, user_id: User.all.sample.id, stamp_card_template_id: StampCardTemplate.all.sample.id)
# puts "Created StampCard for #{seed_stamp_card.user.username} of #{seed_stamp_card.stamp_card_template.shop.name}"
