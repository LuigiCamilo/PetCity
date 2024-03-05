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

# require "open-uri"

# file = URI.open("https://th.bing.com/th/id/R.39b1bc93248764ac4e1ad7b9fe106d11?rik=HW%2fcSGF4c5hM5A&pid=ImgRaw&r=0")
# product = Product.new(title: "Comida para perros adultos", description: "Alimento para perros en edad adulta. 30kg.
#   Sabor carne a la parrilla", price: 10, stock: 5, brand: "Dogourmet", pet: "Perros", category: "Alimentos")
# product.photo.attach(io: file, filename: "perrarina.png", content_type: "image/png")
# product.save
# file = URI.open("https://www.rbdesenos.es/wp-content/uploads/2022/06/82050257.jpg")
# product = Product.new(title: "Cesta para gatos", description: "El Gar Basket  se convertirá en el refugio favorito de
#   tu gato. La cesta incluye un cómodo cojín para tu mascota y dos orejas de gato en la parte superior. La cesta está
#   hecha de jacinto de agua y hierro y es una pieza muy decorativa, un verdadero punto de atracción.
#   Sabor carne a la parrilla", price: 50, stock: 7, brand: "RB Diseños", pet: "Gatos", category: "Muebles")
# product.photo.attach(io: file, filename: "cesta_gato.png", content_type: "image/png")
# product.save

Order.destroy_all
Product.destroy_all
User.destroy_all

# db/seeds.rb
# Usuario de Vendedores
mario = User.create!(
  email: 'mario@gmail.com',
  password: '123456',
  first_name: 'Mario',
  last_name: 'Casas',
  phone_number: '02124567896',
  address: 'La Guairita'
)
mario.photo.attach(io: File.open('app/assets/images/profiles/male_user.jpg'), filename: 'male_user.jpg', content_type: 'image/jpeg')
jessica = User.create!(
  email: 'jessica@gmail.com',
  password: '123456',
  first_name: 'Jessica',
  last_name: 'Chastain',
  phone_number: '04241536987',
  address: 'Catia'
)
jessica.photo.attach(io: File.open('app/assets/images/profiles/female_user.jpg'), filename: 'female_user.jpg', content_type: 'image/jpeg')
# Nombre de los perfumes e imagenes
products = [
  { title: 'Comida para perro', image: 'comida_perro.jpg', price: 20, stock: 7, pet: "Perros", category: "Alimento", brand: "Dogourmet" },
  { title: 'Cesta de gato', image: 'cesta_gato.jpg', price: 50, stock: 4, pet: "Gatos", category: "Muebles", brand: "RB Diseños" },
  { title: 'Comida para hamsters', image: 'comida_hamster.jpg', price: 7.5, stock: 6, pet: "Roedores", category: "Alimento", brand: "Vita Prima" },
  { title: 'Comida para gatos Max Vita', image: 'comida_gato_1.jpg', price: 7, stock: 15, pet: "Gatos", category: "Alimento", brand: "Max Vita" },
  { title: 'Comida para gatos Whiskas', image: 'comida_gato_2.jpg', price: 8, stock: 10, pet: "Gatos", category: "Alimento", brand: "Whiskas" },
  { title: 'Comida para gatos Mirringo', image: 'comida_gato_3.jpg', price: 10, stock: 11, pet: "Gatos", category: "Alimento", brand: "Mirringo" },
  { title: 'Jaula para pájaros', image: 'balancin_pajaro.jpg', price: 2.5, stock: 6, pet: "Aves", category: "Juguetes", brand: "SPRING PARK"  },
  { title: 'Collar de perro', image: 'collar_perro.jpg', price: 12.5, stock: 2, pet: "Perros", category: "Accesorios" , brand: "My Sweet Star Pink" },
  { title: 'Rueda de hamster', image: 'rueda_hamster.jpg', price: 4.7, stock: 3, pet: "Roedores", category: "Juguetes", brand: "BUCATSTATE" },
  { title: "Juguete de perro", image: "juguete_perro.jpg", price: 8.99, stock: 7, pet: "Perros", category: "Juguetes" , brand: "Genérico" }
]
# Descripciones detalladas para cada perfume
descriptions = {
  'Comida para perro' => 'Alimento para perros en edad adulta. 30kg. Sabor carne a la parrilla',
  'Cesta de gato' => 'El Gar Basket  se convertirá en el refugio favorito de tu gato. La cesta incluye un cómodo cojín para
                  tu mascota y dos orejas de gato en la parte superior. La cesta está
                  hecha de jacinto de agua y hierro y es una pieza muy decorativa, un verdadero punto de atracción.
                  Sabor carne a la parrilla',
  'Comida para hamsters' => 'Sunseed® Vita Prima™ Sun Salad para Hamsters 8 Oz',
  'Comida para gatos Max Vita' => 'Alimento Gato Max Vita Castrado Selection Pollo - 1 Kg',
  'Comida para gatos Whiskas' => 'Whiskas Adulto 7+ Senior Mackerel comida seca para gatos 1.1kg',
  'Comida para gatos Mirringo' => 'Gatarina Mirringo X 8kg Adultos 1+. Rico en vitaminas y minerales esenciales',
  'Jaula para pájaros' => 'Soporte de percha de mesa de madera para pájaros pequeños',
  'Collar de perro' => 'Bonito y Exclusivo collar para perros 100% handmade en España.',
  'Rueda de hamster' => 'Rueda Hamster Silenciosa 15cm. Juguete de Hámster Transparente de Ejercicio para roedores',
  "Juguete de perro" => "Nudo de juguete masticable de cuerda de algodón para tirar para perros.
                  Juega a la limpieza interactiva de dientes"
}
# Crear productos y adjuntar imágenes
products.each do |product|
  product_new = Product.create!(
    title: product[:title],
    description: descriptions[product[:title]], # Usar la descripción detallada
    price: product[:price],
    stock: product[:stock],
    category: product[:category],
    pet: product[:pet],
    brand: product[:brand],
    user_id: User.pluck(:id).sample
  )
  # Adjuntar imagen al producto
  image_path = Rails.root.join('app', 'assets', 'images', 'products', product[:image])
  image_blob = ActiveStorage::Blob.create_and_upload!(
    io: File.open(image_path),
    filename: product[:image],
    content_type: 'image/jpeg'
  )
  product_new.photo.attach(image_blob)
  product_new.save
end
