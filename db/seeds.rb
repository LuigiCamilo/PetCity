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

User.destroy_all
Product.destroy_all
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
  email: 'rami@gmail.com',
  password: '123456',
  first_name: 'Jessica',
  last_name: 'Chastain',
  phone_number: '04241536987',
  address: 'Catia'
)
jessica.photo.attach(io: File.open('app/assets/images/profiles/female_user.jpg'), filename: 'female_user.jpg', content_type: 'image/jpeg')
# Nombre de los perfumes e imagenes
products = [
  { title: 'Comida para perro', image: 'Sauvage.jpg' },
  { title: 'Cesta de gato', image: 'Vogue.jpg' },
  { title: 'Comida para hamsters', image: 'Chanel.jpg' },
  { title: 'Comida para gatos', image: 'Yves_Saint_Laurent.jpg' },
  { title: 'Comida para gatos', image: 'Boss.jpg' },
  { title: 'Comida para gatos', image: 'Hugo.jpg' },
  { title: 'Jaula para pájaros', image: 'Armaf.jpg' },
  { title: 'Collar de perro', image: 'Nautica_Voyage.jpg' },
  { title: 'Rueda de hamster', image: 'Lattafa.jpg' },
  { title: "Juguete de perro", image: "L'Bel_Bleu.jpg" }
]
# Descripciones detalladas para cada perfume
descriptions = {
  'Sauvage' => 'Una fragancia sensual para hombres, con notas de bergamota, ámbar y pachulí.',
  'Vogue' => 'Vogue perfume es una fragancia para mujeres que se destaca por sus notas florales y aldehídicas. ' \
           'Al aplicar el perfume, se recomienda evitar frotar las muñecas para no romper las notas y ' \
           'aplicarlo en puntos estratégicos como la parte trasera de las orejas, el escote, las muñecas, ' \
           'los tobillos y la parte trasera de las rodillas',
  'Chanel' => 'Una fragancia icónica tanto para hombres como para mujeres, con toques cítricos, jazmín y sándalo.',
  'Yves_Saint_Laurent' => 'Una fragancia atrevida y sofisticada con notas de grosella negra, rosa y vainilla.',
  'Boss' => 'Una fragancia fresca y enérgica para hombre, con toques de manzana, cítricos y sándalo.',
  'Hugo' => 'Una fragancia moderna y urbana para hombre, con notas de menta, lavanda y vetiver.',
  'Armaf' => 'Armaf es una marca de fragancias que ofrece una amplia gama de perfumes para hombres y mujeres. La marca es conocida por ofrecer una variedad de fragancias de alta calidad a precios asequibles. Sus perfumes abarcan una variedad de estilos y notas aromáticas, desde frescos y florales hasta amaderados y orientales.',
  'Nautica_Voyage' => 'Es una fragancia para hombres lanzada por la marca Nautica. Es conocida por su frescura y su aroma marino, inspirado en la navegación y la aventura en el mar. Esta fragancia se caracteriza por sus notas frescas y acuáticas que evocan la sensación de la brisa marina y la libertad del océano.',
  'Lattafa' => 'Lattafa ofrece una variedad de fragancias para hombres y mujeres, que van desde opciones dulces y afrutadas hasta fragancias más intensas y orientales. Sus perfumes suelen ser duraderos y cuentan con una excelente proyección, lo que los hace ideales para diversas ocasiones.',
  "L'Bel_Bleu" => "L'Bel es una reconocida marca de cosméticos que ofrece una amplia gama de productos para el cuidado facial, corporal y capilar."
}
# Crear productos y adjuntar imágenes
perfumes.each do |perfume|
  product = Product.create!(
    name: perfume[:name],
    description: descriptions[perfume[:name]],  # Usar la descripción detallada
    price: rand(10.0..100.0).round(2),
    user_id: User.pluck(:id).sample
  )
  # Adjuntar imagen al producto
  image_path = Rails.root.join('app', 'assets', 'images', 'perfumes', perfume[:image])
  image_blob = ActiveStorage::Blob.create_and_upload!(
    io: File.open(image_path),
    filename: perfume[:image],
    content_type: 'image/jpeg'
  )
  product.photo.attach(image_blob)
end
# Usuario de Comprador
carlos = User.create!(
  email: 'carlos@gmail.com',
  password: '12345678',
  name: 'Carlos',
  last_name: 'Landaeta',
  phone_number: '987654321',
  address: 'La Trinidad'
)
carlos.photo.attach(io: File.open('app/assets/images/perfiles/User_Hombre2.jpg'), filename: 'User_Hombre2.jpg', content_type: 'image/jpeg')
