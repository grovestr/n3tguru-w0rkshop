# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

25.times do |i|
  Review.create!(content: "This is example of review ##{i}",
                  rating: "#{rand(1..5)}",
                  product_id: "#{rand(1..5)}",
                  user_id: "#{rand(1..5)}"
  )
end

User.create!(email: "admin@email.com",
             firstname: "Joe",
             lastname: "Doe",
             admin: true,
             password: "12345678",
             password_confirmation: "12345678")

4.times do |i|
  User.create!(email: "email#{i}@email.com",
               firstname: "Firstname#{i}",
               lastname: "Lastname#{i}",
               admin: false,
               password: "12345678",
               password_confirmation: "12345678"
  )
end

5.times do |i|
  Product.create!(title: "This is example of product ##{i}",
                  description: "Description ##{i}",
                  price: "#{rand(1..256)}",
                  category_id: "#{rand(1..2)}",
                  user_id: "#{rand(1..5)}"
  )
end

Category.create!(name: "1st category")
Category.create!(name: "2nd category")