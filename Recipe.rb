require './MainMenu.rb'
require 'json'
require './file'

class Recipe
  attr_accessor :id, :name, :ingredients, :description, :favorite

  def initialize (id = '00', name = 'default_name', ingredients = ['default'], description = 'default', favorite = false)
    @id = id
    @name = name
    @ingredients = ingredients
    @description = description
    @favorite = favorite
  end

  def favorite_change
    @favorite = !@favorite
  end

  def show_recipe
    puts "#{@id}, #{@name}, #{@ingredients}, #{@description}"
  end

  def self.add_recipe
    puts 'Enter name of recipe '
    rname = gets.chomp
    puts "Enter a name of ingredients with use coma \",\""
    iname = gets.chomp.split(",")
    puts 'Enter a description of the recipe'
    description = gets.chomp
    id = DATA.generate_id
    recipe_from_user = { "id" => id, "name" => rname, "ingredients" => iname, "description" => description, "favorite" => false }
    DATA.add_to_data(recipe_from_user)
  end

  def self.menu
    while true
      puts '1. Show all'
      puts '2. Search by Name'
      puts '3. Create recipe'
      puts '4. Show Favorites'
      puts '0. Back'

      puts 'Enter a number '
      user_inputs = gets.chomp
      case user_inputs
      when '1'
        DATA.all_recipes.each { |recipe| puts "Recipe Name: #{recipe.name}, ID:#{recipe.id}" }
        RecipeAct.id_from_user
      when '2'
        Search.by_name
        RecipeAct.id_from_user
      when '3'
        Recipe.add_recipe
      when '4'
        RecipeAct.show_favorites
      when '0'
        Menu_main.main
      else
        Menu_main.error_text
      end
    end
  end
end