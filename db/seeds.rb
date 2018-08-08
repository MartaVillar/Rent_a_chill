# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'


User.destroy_all
Chill.destroy_all
Booking.destroy_all

# Seeding Users
puts "Creating 20 users..."
20.times do
  User.new(
    email: Faker::Internet.email,
    name: Faker::Name.name ,
    birthday: Faker::Date.birthday(18, 65),
    description: Faker::Community.quotes,
    interests: Faker::Community.quotes,
    phone: Faker::PhoneNumber.phone_number,
    password: (0...8).map { (65 + rand(26)).chr }.join
  ).save!
  end
  puts "Created #{User.count} users sucessfully!"
  puts "The last user created is #{User.last.name} born on #{User.last.birthday}  with the ID:#{User.last.id}"

# Seeding Chills
puts "Creating 20 chills..."
20.times do
  Chill.new(
    title: Faker::UmphreysMcgee.song,
    capacity: Faker::Types.rb_integer(1,20),
    price_per_hour: Faker::Types.rb_integer(1,1000),
    available: Faker::Boolean.boolean,
    description: Faker::HarryPotter.quote,
    location: Faker::Address.full_address,
    category: Faker::Space.planet,
    area: Faker::Types.rb_integer(0,50),
    chill_power: Faker::Types.rb_integer(1,5),
    user: User.all.sample
    ).save!
  end
  puts "Created #{Chill.count} chills sucessfully!"
  puts "Last Chill was #{Chill.last.title} with the ID:#{Chill.last.id}!"

puts "Creating 20 bookings..."
20.times do
  Booking.new(
    date: DateTime.new(2001,2,3,4,5,6),
    chill: Chill.all.sample,
    user: User.all.sample,
  ).save!
  end
 puts "Created #{Booking.count} bookings sucessfully!"
 puts "Last Booking was created for #{Booking.last.date} with the ID:#{Booking.last.id}!"

["sabrina@rentachill.com", "marta@rentachill.com", "tiago@rentachill.com"].each do |email|
  User.create(email: email, password: "password")
end
