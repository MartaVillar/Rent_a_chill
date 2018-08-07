# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Chill.destroy_all


puts "Creating users..."

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

20.times do
  Chill.new(
    title: Faker::AquaTeenHungerForce.character,
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

puts "Last Chill was #{Chill.last.title}!"

["sabrina@rentachill.com", "marta@rentachill.com", "tiago@rentachill.com"].each do |email|
  User.create(email: email, password: "password")
end

