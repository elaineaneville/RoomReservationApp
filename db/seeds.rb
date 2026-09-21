# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#clear any existing data when reseed
Reservation.delete_all
User.delete_all
Room.delete_all
Site.delete_all

staff_user = User.create!(
  name: "Staff User",
  email: "staff@example.com",
  password: "password",
  password_confirmation: "password",
  role: :staff
)

User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  role: :admin
)

#create sites
#pretend college sites
science_building = Site.create!(
  name: "Science Building",
  address: "123 Science St, College Town, USA",
  description: "The Science Building houses the biology, chemistry, and physics departments."
)

library = Site.create!(
  name: "Library",
  address: "456 Library Ln, College Town, USA",
  description: "The Library is the central hub for research and study, offering a wide range of resources."
)

humanities_building = Site.create!(
  name: "Humanities Building",
  address: "789 Humanities Rd, College Town, USA",
  description: "The Humanities Building is home to the literature, history, and philosophy departments."
)

#create rooms for each site
science_building.rooms.create!([
  { name: "Chemistry Lab", capacity: 30, description: "A fully equipped chemistry laboratory for experiments and research." },
  { name: "Physics Lab", capacity: 25, description: "A modern physics laboratory for advanced research and teaching." },
  { name: "Biology Lab", capacity: 20, description: "A well-stocked biology laboratory for cell and molecular research." }
])

library.rooms.create!([
  { name: "Study Room A", capacity: 10, description: "A quiet study room with individual desks and chairs." },
  { name: "Study Room B", capacity: 12, description: "A collaborative study room with a large table and whiteboard." },
  { name: "Conference Room", capacity: 15, description: "A conference room for group meetings and presentations." }
])

humanities_building.rooms.create!([
  { name: "History Classroom", capacity: 40, description: "A spacious classroom for history lectures and discussions." },
  { name: "Literature Classroom", capacity: 35, description: "A comfortable classroom for literature classes and workshops." },
  { name: "Philosophy Seminar Room", capacity: 20, description: "A seminar room for philosophy discussions and debates." }
])

#confirm creation of data
puts "Seed data created successfully!"