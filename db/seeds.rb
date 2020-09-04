# For API movie seeds refers to parsing method in movie.rb
require 'uri'
require 'net/http'
require 'openssl'
require 'faker'

puts "DESTROYING USERS..."
puts "DESTROYING HOUSEHOLDS..."
puts "DESTROYING USER HOUSEHOLDS..."
puts "DESTROYING DANNY..."

User.destroy_all
Household.destroy_all
UserHousehold.destroy_all

 user = User.create!({
  name: "Danny",
  email: "danny@deve.to",
  password: "123456",
 })
 user.save

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
10.times do
  adminuser2 = User.all.sample
  household = Household.create!({
  name: Faker::Color.unique.color_name,
  user: adminuser2
 })
 household.save
  10.times do
  userhousehold = UserHousehold.create!({
  user: User.all.sample,
  household: household,
  total_points: rand(1..10),
  vetos_remaining:rand(1..10),
  user_turn: false,
 })
  end
  userhousehold = UserHousehold.create!({
  user: adminuser2,
  household: household,
  total_points: rand(1..10),
  vetos_remaining:rand(1..10),
  user_turn: false,
 })
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

