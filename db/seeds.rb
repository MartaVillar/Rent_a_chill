# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

LOCATIONS = ["R. do Carmo 51-1, 1200-094, 04015-070, Lisbon", "Rua de Entrecampos 13-3° Esq. 1000-152 Lisbon",
  "Av. Guerra Junqueiro 30 C, 1000-167 Lisbon", "Largo do Carmo 4, 1200-022 Lisbon", "R. de São Pedro de Alcântara 81, 1250-238 Lisbon",
  "Rua da Esperança 146, 1200-660 Lisbon",
  "R. 4 de Infantaria 3A, 1350-134 Lisbon", "R. Gurué 16, 2775-581 Carcavelos",
  "Avenida Marginal - Carcavelos beach, 2775-604 Carcavelos", "R. Francisco Franco, 2780-321 Oeiras",
  "R. Luís Xavier Palmeirim 14, 2750-298 Cascais", "Av. Marginal 7669, 2765-245 Estoril",
  "R. Alentejo 12, 2765-188 Estoril", "Estrada da Lagoa Azul, Linhó Sintra, 2714-511 Lisbon"]

NAMES =  ["Augusto Menezes", "Antelmo Bandeira", "Dinis Roque", "Vicente Pascoal",
  "Feliciano Resende", "Victorino Gusmão", "Xavier Rodrigues", "Jacó Álvares",
  "Carmo Azevedo", "Otávio Barbosa", "Alexandra Nogueira", "Érica Valente",
  "Brígida Fidalgo", "Paulinha Leitão", "Leonor Leite", "Luzia Soares",
  "Iara Cortes", "Soraia Furtado", "Vera Fernandes", "Bruna Pacheco", "Vi Gose",
  "Teddy Boshart", "Krista Herriman", "Mardell Dove", "Mildred Flippo",
  "Wilbert Orourke", "Mohammad Morales", "Malorie Klapper", "Jeniffer Obrian", "Judy Dejean"]

CATEGORY = ["Pool", "Tub", "Hose", "Sprinkler", "Inflatable Pool", "Other"]

DESCRIPTION = ["Olympic-sized swimming pool",
  "Refreshing Inflatable Bestway 10ft Pool in small backyard",
  "Unique pink inflatable pool", "8 Spray pattern garden hose 2m long",
  "Green lightweight adn flexible garden hose", "Garden Lawn Oscillating Sprinkler",
  "360 Degree Rotating Sprinkler Irrigation System", "Rain Bird 25PJDAC Brass Impact Sprinkler",
  "20m Indoor Pool", "15m round outdoor pool", "Cute 5m garden pool",
  "Treat yourself and soak in tranquility inside a freestanding bathtub",
  "American Standard Cambridge 5-Feet Bath Tub", "2 L worth of ice cubes",
  "Magnum, Haagen Dazs, Ben & Jerry's ice-cream!!"]

Booking.destroy_all
Chill.destroy_all
User.destroy_all

# Seeding Users
puts "Creating 20 users..."
20.times do
  User.new(
    email: Faker::Internet.email,
    name: NAMES.sample,
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
    description: DESCRIPTION.sample,
    location: LOCATIONS.sample,
    category: CATEGORY.sample,
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
