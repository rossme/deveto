# For API movie seeds refers to parsing method in movie.rb
require 'uri'
require 'net/http'
require 'openssl'
require 'faker'

puts "DESTROYING USERS..."
puts "DESTROYING HOUSEHOLDS..."
puts "DESTROYING USER HOUSEHOLDS..."
puts "DESTROYING DANNY..."
UserHousehold.destroy_all
Household.destroy_all
User.destroy_all


user_selected = []

data_users = [
  {
    name: "Ricardo",
    email: "ricardo@gmail.com",
    password: "123456"
  },
  {
    name: "Cass",
    email: "cass@gmail.com",
    password: "123456"
  },
  {
    name: "Megan",
    email: "megan@gmail.com",
    password: "123456"
  },
  {
    name: "Lara",
    email: "lara@gmail.com",
    password: "123456"
  },
  {
    name: "Eukleyv",
    email: "eukleyv@gmail.com",
    password: "123456"
  },
  {
    name: "Branca",
    email: "branca@gmail.com",
    password: "123456"
  },
  {
    name: "Samira",
    email: "samira@gmail.com",
    password: "123456"
  },
  {
    name: "Maria",
    email: "maria@gmail.com",
    password: "123456"
  },
  {
    name: "Louis",
    email: "louis@gmail.com",
    password: "123456"
  },
  {
    name: "Adriano",
    email: "adriano@gmail.com",
    password: "123456"
  },
  {
    name: "Danny",
    email: "danny@deve.to",
    password: "123456"
  }
]
data_users.each do |props|
  user = User.create!({
  name: props[:name],
  email: props[:email],
  password: props[:password]
  })
end


puts "SEEDING HOUSEHOLDS..."
puts "SEEDING USERHOUSEHOLDS..."

users = User.all.to_a

puts "SEEDING HOUSEHOLDS..."
puts "SEEDING USERHOUSEHOLDS..."
count = 1


puts "SEEDING USERS..."
20.times do
 user = User.create!({
  name: Faker::Name.first_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password,
 })
 user.save
end
puts "SEEDING HOUSEHOLDS..."
puts "SEEDING USERHOUSEHOLDS..."

5.times do
  household = Household.create!({
  name: Faker::Color.unique.color_name,
  user: User.last
 })
 household.save
2.times do |count2|

  selected_user = users.sample


  userhousehold = UserHousehold.create!({
  user: selected_user,
  household: household,
  total_points: rand(1..10),
  vetos_remaining:rand(1..10),
  user_turn: false,
 })
  users.delete(selected_user)
 end
end
puts "DESTROYING NETFLIX MOVIES..."
Movie.destroy_all
movies = NetflixApiService.parsing
movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    rating: movie['rating'],
    released: movie['released'],
    media: movie['type'],
    netflixid: movie['netflixid'],
    synopsis: movie['synopsis'],
    image: movie['image'],
    runtime: movie['runtime']
  )
end
