# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Animal.destroy_all

[
  { name: "bear", weight: 500, height: 63, lifespan: 34, gestation: 138, diet: :omni },
  { name: "cat", weight: 9, height: 13, lifespan: 13, gestation: 34, diet: :meat },
  { name: "deer", weight: 300, height: 83, lifespan: 20, gestation: 99, diet: :herb },
  { name: "dog", weight: 80, height: 40, lifespan: 15, gestation: 82, diet: :meat },
  { name: "human", weight: 150, height: 66, lifespan: 73, gestation: 280, diet: :omni },
  { name: "moose", weight: 800, height: 120, lifespan: 35, gestation: 180, diet: :herb },
  { name: "raccoon", weight: 20, height: 32, lifespan: 8, gestation: 63, diet: :omni },
  { name: "rat", weight: 4, height: 8, lifespan: 3, gestation: 20, diet: :omni }
].each do |animal|
  Animal.create(animal)
end
