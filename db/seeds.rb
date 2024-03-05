# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# new_user = User.new(: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# new_product = Product.new()
# seeds.rb

# Crear 20 usuarios
require 'faker'
require "open-uri"

# seeds.rb

# Crear 20 usuarios
users = []
20.times do |i|
  users << User.create!(
    email: "user#{i + 1}@example.com",
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address
  )
end

# Crear al menos 20 productos para cada usuario
users.each do |user|
  20.times do
    product = user.products.create!(
      title: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price(range: 100..1000),
      stock: Faker::Number.between(from: 1, to: 100),
      brand: Faker::Commerce.brand,
      pet: ["Dog", "Cat", "Fish", "Bird"].sample,
      category: Faker::Commerce.department(max: 1)
    )

    # Agregar imagen al producto
    file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
    product.photo.attach(io: file, filename: "product_image#{product.id}.jpg", content_type: "image/jpeg")
    product.save
  end
end
