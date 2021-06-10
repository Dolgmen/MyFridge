require './MainMenu.rb'
require 'json'
require './file'

class Recipe
  attr_accessor :id, :name, :ingredients, :description, :is_favorite

  def initialize (id = '00', name = 'default_name', ingredients = ['default'], description = 'default', is_favorite = false)
    @id = id
    @name = name
    @ingredients = ingredients
    @description = description
    @is_favorite = is_favorite
  end

  def is_favorite_change
    @is_favorite = !@is_favorite
    # if @is_favorite == false
    #   @is_favorite = true
    # else
    #   @is_favorite = false
    # end
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
    recipe_from_user = { "id" => id, "name" => rname, "ingredients" => iname, "description" => description, "is_favorite" => false }
    DATA.add_to_data(recipe_from_user)
  end
end