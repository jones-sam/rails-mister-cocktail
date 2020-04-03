# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

response = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
ingredients = JSON.parse(response.string)

Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

ingredients['drinks'].each do |ingredient|
  i = Ingredient.create(name: ingredient['strIngredient1'])

  cocktail = Cocktail.create(
    name: Faker::Beer.name
  )

  Dose.create(
    cocktail_id: cocktail.id,
    ingredient_id: i.id,
    description: Faker::Food.measurement
  )
end
