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

# Category.create(name: 'Pizza', description: "Traditional", display: true)
# Category.create(name: 'Burgers', description: 'Hello', display: true)
# Category.create(name: 'Desserts', description: 'Desserts', display: true)

# 10.times do |i|
#   pizza = Product.create(
#     name: "Pizza #{i}",
#     description: 'Nice Pizza',
#     price: 11.99,
#     category: Category.find(1)
#   )
#   burger = Product.create(
#     name: "Burger #{i}",
#     description: 'Best Burger',
#     price: 7.95,
#     category: Category.find(2)
#   )
#   dessert = Product.create(
#     name: "Icecream #{i}",
#     description: 'Real cold',
#     price: 3.00,
#     category: Category.find(3)
#   )
# end