# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Creating 10 Hotels"
10.times do |i|
  hotel = Hotel.create!(
    name: Faker::Company.name,
    address: Faker::Address.address
    price: rand(50...300)
    rating: rand(1..5)
    occupancy: rand(1..8)
    description: Faker::Quote.famous_last_words
  )
  hotel.save!
end
puts "Finished!"
