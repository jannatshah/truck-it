# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Preparing diets..."

diets = ["Vegan", "Vegetarian", "Halal", "Kosher",
        "Lacto free", "Gluten free", "Nut free", "Sugar free"]
diets.each do |diet|
  Diet.create(requirement: diet)
end

puts "Diets now available!"
