# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all
50.times do |index|
  cost = rand(500)
  product = Product.create!(name: Faker::Job.field.titleize, cost: cost, country_of_origin: Faker::Games::HalfLife.location)
  5.times do |index|
    rating = rand(5)
    name_a = Faker::Hipster.word
    name_b = Faker::Hipster.word
    fullname = (name_a + " " + name_b).titleize
    Review.create!(author: fullname, rating: rating, content_body: Faker::ChuckNorris.fact, product_id: product.id)
  end
end
p "Created #{Product.count} Products"
p "Created #{Review.count} reviews"
