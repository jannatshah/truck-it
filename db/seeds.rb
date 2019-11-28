puts "Preparing diets..."

diets = ["Vegan", "Veggie", "Spicy", "Halal", "Kosher",
        "Lacto free", "Gluten free", "Nut free", "Sugar free"]
diets.each do |diet|
  Diet.create(requirement: diet)
end

puts "Diets now available!"
