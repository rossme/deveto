# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

### For API movie seeds refers to parsing method in movie.rb
require 'uri'
require 'net/http'
require 'openssl'

movies = NetflixApiService.parsing

#DB movie schema needs changing to match API schema.
movies.each do |movie|
  Movie.create!(
    title: movie['title'],
  )
end
