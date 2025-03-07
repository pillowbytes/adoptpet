# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# API KEYs
# Clear existing pets to avoid duplication
puts "Cleaning pet database..."
Pet.destroy_all

# Create pets manually
puts "Creating pets..."

pets = [
  {
    name: "Luna",
    age: 3,
    species: "Dog",
    gender: "Female",
    size: "Medium",
    image_url: "https://www.pedigree.com.br/cdn-cgi/image/format=auto,q=90/sites/g/files/fnmzdf2401/files/2024-09/celebre-o-dia-nacional-da-adocao-de-animais_0.jpg",
    is_available: true
  },
  {
    name: "Max",
    age: 2,
    species: "Cat",
    gender: "Male",
    size: "Small",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/800px-Cat03.jpg",
    is_available: true
  },
  {
    name: "Rocky",
    age: 5,
    species: "Dog",
    gender: "Male",
    size: "Large",
    image_url: "https://blog-static.petlove.com.br/wp-content/uploads/2017/07/curiosidades-sobre-vira-latas-3.jpg",
    is_available: false
  }
]

# Create each pet in the database
pets.each do |pet_attributes|
  pet = Pet.create!(pet_attributes)
  puts "Created #{pet.name}, a #{pet.species}"
end

puts "Created #{Pet.count} pets!"
