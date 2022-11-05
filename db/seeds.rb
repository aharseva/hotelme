# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
Hotel.destroy_all
User.destroy_all

user = User.new(email: "admin@admin.com", password: "123456")

puts "Creating 10 Hotels"
2.times do |i|
  Hotel.create!(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    price: rand(50...300),
    rating: rand(1..5),
    occupancy: rand(1..8),
    description: Faker::Quote.famous_last_words,
    user: user
  )
end
puts "Finished!"
