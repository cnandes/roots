# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require_relative 'veggie_names'

if User.all.empty?
  puts "Please create at least one User via the sign up page."
  return
end

puts "Cleansing DB"
Crop.destroy_all
Veggie.destroy_all
Bed.destroy_all
Garden.destroy_all

# Add 4 Gardens
puts "Populating Gardens"
4.times do
  garden = Garden.new(user_id: 1, name: "#{Faker::Address.community} Garden")
  puts "Created Garden with id: #{garden.id}" if garden.save
end

# Add Beds all gardens (one will remain empty as an edge case for views)
puts "Populating Beds"
Garden.all.first(3).each do |garden|
  rand(2..5).times do
    bed = Bed.new(
      description: "#{Faker::Games::Minecraft.biome} Bed",
      garden_id: garden.id,
      width: rand(3..6) * 100,
      length: rand(5..10) * 100
    )
    puts "----"
    puts "Created Bed with id: #{bed.id} in Garden #{garden.id}" if bed.save
  end
end

# Add many Veggies
puts "Populating Veggies"
veggie_array = VEGE_ARRAY
veggie_array.each do |vege|
  Veggie.create(name: vege)
end
puts "Added #{Veggie.all.count} veggies to the database 🌱"

# Add Crops to Beds
puts "Planting Crops in Beds"
Bed.all.each do |bed|
  rand(2..4).times do
    crop = Crop.new(
      quantity: rand(1..10),
      bed_id: bed.id,
      veggie_id: Veggie.first.id + rand(veggie_array.length)
    )
    puts "Created crop with id: #{crop.id} in bed with id: #{bed.id}" if crop.save
  end
end
