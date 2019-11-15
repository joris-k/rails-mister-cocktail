# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

require 'json'
require 'open-uri'
p "Destroy all models"

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

p "Successfully desteoyed all models"


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

 ingredients['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
 end

cocktails_attributes = [
{
  name: 'Bloody Mary'
},
{
  name: 'White Russian'
},
{
  name: 'Mojito'
}
]

Cocktail.create!(cocktails_attributes)

Dose.create!(description: '3cl',
  cocktail: Cocktail.first,
  ingredient: Ingredient.first)

Dose.create!(description: '50ml',
  cocktail: Cocktail.first,
  ingredient: Ingredient.last)
