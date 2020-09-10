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


data_users = [
  {
    name: "Ricardo",
    email: "ricardo@gmail.com",
    password: "123456",
    url: "https://avatars3.githubusercontent.com/u/67806990?v=4"
  },
  {
    name: "Ross",
    email: "ross@gmail.com",
    password: "123456",
    url: "https://avatars1.githubusercontent.com/u/66185926?v=4"
  },
   {
    name: "Leonor",
    email: "leonor@gmail.com",
    password: "123456",
    url: "https://avatars1.githubusercontent.com/u/63351704?v=4"
  },
  {
    name: "Cass",
    email: "cass@gmail.com",
    password: "123456",
    url: "https://avatars1.githubusercontent.com/u/59645241?v=4"

  },
  {
    name: "Megan",
    email: "megan@gmail.com",
    password: "123456",
    url: "https://avatars1.githubusercontent.com/u/51266086?v=4"
  },
  {
    name: "Lara",
    email: "lara@gmail.com",
    password: "123456",
    url: "https://avatars3.githubusercontent.com/u/61751892?v=4"
  },
  {
    name: "Eukleyv",
    email: "eukleyv@gmail.com",
    password: "123456",
    url: "https://avatars1.githubusercontent.com/u/68221749?v=4"
  },
  {
    name: "Branca",
    email: "branca@gmail.com",
    password: "123456",
    url: "https://avatars2.githubusercontent.com/u/68083103?v=4"
  },
  {
    name: "Samira",
    email: "samira@gmail.com",
    password: "123456",
    url: "https://avatars1.githubusercontent.com/u/38704468?v=4"

  },
  {
    name: "Maria",
    email: "maria@gmail.com",
    password: "123456",
    url: "https://avatars1.githubusercontent.com/u/67118326?v=4"
  },
  {
    name: "Louis",
    email: "louis@gmail.com",
    password: "123456",
    url: "https://avatars1.githubusercontent.com/u/61750901?v=4"
  },
  {
    name: "Adriano",
    email: "adriano@gmail.com",
    password: "123456",
     url: "https://avatars0.githubusercontent.com/u/67058933?v=4"
  },
  {
    name: "Danny",
    email: "danny@deve.to",
    password: "123456",
    url: "https://res.cloudinary.com/djnfnwxgu/image/upload/v1599561280/deveto/original_nkgfa8.png"
  }
]
data_users.each do |props|
  user = User.create!({
  name: props[:name],
  email: props[:email],
  password: props[:password],
  url: props[:url]
  })
end


puts "SEEDING HOUSEHOLDS..."
puts "SEEDING USERHOUSEHOLDS..."

users = User.all.to_a
count = 1

household_array = ["Family", "Friends", "Le Wagon Family", "Grandma's House", "Cousin's House"]

5.times do
  household = Household.create!({
  name: household_array.sample,
  user: User.last
 })
 household.save

2.times do |count2|
  selected_user = users.sample
  userhousehold = UserHousehold.create!({
  user: selected_user,
  household: household,
  total_points: 0,
  vetos_remaining: 1,
  user_turn: true,
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
