# For API movie seeds refers to parsing method in movie.rb
require 'uri'
require 'net/http'
require 'openssl'
require 'faker'

puts "destroy users"
User.destroy_all

10.times do
 user = User.create!({
  email: Faker::Internet.email,
  password: Faker::Internet.password,
 })
end

puts "destroy households"
Household.destroy_all

10.times do
 user = Household.create!({
  name: Faker::TvShows::BigBangTheory.character ,
 })
end

movies = NetflixApiService.parsing

#DB movie schema needs changing to match API schema.
movies.each do |movie|
  Movie.create!(
    title: movie['title'],
  )
end

# puts "destroy movies"
# Movie.destroy_all

# puts "scrapping lowest rated movies"
# ScrappingImdbService.new.call("https://www.imdb.com/chart/bottom?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=4da9d9a5-d299-43f2-9c53-f0efa18182cd&pf_rd_r=4HHYC932YF2QG4D752JD&pf_rd_s=right-4&pf_rd_t=15506&pf_rd_i=bottom&ref_=chtbtm_ql_8")

# puts "scrapping top rated movies"
# ScrappingImdbService.new.call("https://www.imdb.com/chart/top/?ref_=nv_mv_250")