# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "destroy users"
User.destroy_all

10.times do
 user = User.create!({
  email: Faker::Internet.email,
  password: Faker::Internet.password,
 })
end

puts "destroy movies"
Movie.destroy_all

puts "scrapping lowest rated movies"
ScrappingImdbService.new.call("https://www.imdb.com/chart/bottom?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=4da9d9a5-d299-43f2-9c53-f0efa18182cd&pf_rd_r=4HHYC932YF2QG4D752JD&pf_rd_s=right-4&pf_rd_t=15506&pf_rd_i=bottom&ref_=chtbtm_ql_8")


puts "scrapping top rated movies"
ScrappingImdbService.new.call("https://www.imdb.com/chart/top/?ref_=nv_mv_250")




puts "destroy households"
Household.destroy_all

10.times do
 user = Household.create!({
  name: Faker::TvShows::BigBangTheory.character ,
 })
end



