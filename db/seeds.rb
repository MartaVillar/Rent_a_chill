# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

puts "Creating 20 users..."

Booking.destroy_all

20.times do
  User.new(
    email: Faker::Internet.email,
    name: Faker::Name.name ,
    birthday: Faker::Date.birthday(18, 65),
    description: Faker::Community.quotes,
    phone: Faker::PhoneNumber.phone_number,
    password: (0...8).map { (65 + rand(26)).chr }.join
  ).save!
  end

  puts "Created#{User.count} users sucessfully!"
  puts "The last user created is #{User.last.name} born on #{User.last.birthday}"

puts "Creating 20 bookins..."

20.times do
  Booking.new(
    date: DateTime.new(2001,2,3,4,5,6),
    chill_id: rand(1..20),
    date: Faker::Time.between(50.days.ago, Date.today, :afternoon),
    user_id: rand(1..20),
  ).save!
  end

  puts "Created#{Booking.count} users sucessfully!"
  puts "The last booking created is #{Booking.last}"
