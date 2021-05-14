# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true)

Category.create(name: 'Pizza', description: "It's so good, dough!", display: true)
Category.create(name: 'Pasta', description: 'We cannoli do so much in each vide', display: true)
Category.create(name: 'Desserts', description: 'Rock rails icecream', display: true)

10.times do |i|
  pizza = Product.create(
    name: "Pizza #{i}",
    description: 'Lorem ipsum bbq chicken free range dough',
    price: 11.99,
    category: Category.find(1)
  )
  pasta = Product.create(
    name: "Pasta #{i}",
    description: 'Lorem ipsum bbq chicken free range dough',
    price: 7.95,
    category: Category.find(2)
  )
  dessert = Product.create(
    name: "Icecream #{i}",
    description: 'Lorem ipsum bbq chicken free range dough',
    price: 3.00,
    category: Category.find(3)
  )
end