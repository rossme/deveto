# For API movie seeds refers to parsing method in movie.rb
require 'uri'
require 'net/http'
require 'openssl'
require 'faker'

puts "DESTROYING USERS..."
Household.destroy_all
UserHousehold.destroy_all
User.destroy_all
puts "DESTROYING HOUSEHOLDS..."



 user = User.create!({
  email: "danny@deve.to",
  password: "123456",
 })
 user.save

puts "SEEDING USERS..."
20.times do
 user = User.create!({
  email: Faker::Internet.email,
  password: Faker::Internet.password,
 })
 user.save
end


puts "SEEDING HOUSEHOLDS..."
10.times do
  adminuser = User.all.sample
 household = Household.create!({
  name: Faker::TvShows::BigBangTheory.character ,
  user: adminuser
 })
 household.save
 puts "SEEDING USERHOUSEHOLDS..."
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
  user: adminuser,
  household: household,
  total_points: rand(1..10),
  vetos_remaining:rand(1..10),
  user_turn: false,
 })
end


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

# puts "destroy movies"
# Movie.destroy_all

# puts "scrapping lowest rated movies"
# ScrappingImdbService.new.call("https://www.imdb.com/chart/bottom?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=4da9d9a5-d299-43f2-9c53-f0efa18182cd&pf_rd_r=4HHYC932YF2QG4D752JD&pf_rd_s=right-4&pf_rd_t=15506&pf_rd_i=bottom&ref_=chtbtm_ql_8")

# puts "scrapping top rated movies"
# ScrappingImdbService.new.call("https://www.imdb.com/chart/top/?ref_=nv_mv_250")
