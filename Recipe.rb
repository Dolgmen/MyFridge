require './MainMenu.rb'
require 'json'
require './file'

class Recipe
  attr_accessor :id, :name, :ingredients

  def initialize (id, name, ingredients)
    @id = id
    @name = name
    @ingredients = ingredients
  end

  def description
    puts "#{@id}, #{@name}, #{@ingredients}"
  end
end

# class CreateRecipe
#   attr_accessor :reciper
#
#   def add_recipe
#     puts 'Enter name of recipe '
#     rname = gets.chomp
#     puts "Enter a name of ingredients with use coma \",\""
#     iname = gets.chomp.split(", ")
#     puts 'Enter a description of the recipe'
#     description = gets.chomp
#     reciper = { 'name' => rname, 'rname' => iname, 'descrip' => description }
#     # File.open(@file_name, "a") do |file|
#     #   file.write "#{hash_of_recipe} \n "
#     # end
#   end
# end

class RecipeAct
  def self.with_recipe(recipe_id)
    recipe_id = recipe_id.to_i
    DATA.all_recipes[recipe_id - 1].description
    while true
      puts '1. Add to favorites'
      puts '2. Edit recipe'
      puts '3. Delete recipe'
      puts '0. Back to main'
      puts ''
      puts 'Enter a number '
      user_input = gets.chomp
      case user_input
      when '1'
        #Має бути метод Recipe який додає до улюблених
        puts('Added to favorites')
      when '2'
        #Має бути метод Recipe який редагує
        puts('Edited recipe')
      when '3'
        DATA.delete_from_data
        puts('Delete Recipe')
      when '0'
        Menu_main.general_main
      end
    end
  end
end

class RecipeStore
  attr_accessor :all_recipes, :recipe_list_hash, :reciper

  def initialize
    @file_name = 'recipe.json'
    @recipe_list_hash = load
    @all_recipes = hash_to_obj
  end

  def load
    begin
      recipe_list_hash = JSON.parse(File_::FileHelper.read(@file_name))
      recipe_list_hash
    rescue
      recipe_list_hash = {}
      recipe_list_hash
    end
  end

  def obj_to_hash(obj_list)
    recipe_list_hash = obj_list.map do |object|
      hash = {}
      object.instance_variables.each { |var| hash[var.to_s.delete("@")] = object.instance_variable_get(var) }
      hash
    end
    recipe_list_hash
  end

  def hash_to_json
    @recipe_list_hash.to_json
  end

  def save_helper
    @text = hash_to_json
    File_::FileHelper.write(@file_name, text)
  end

  def add_to_data(hash)
    @recipe_list_hash < hash
    save_helper
    hash_to_obj
  end

  def delete_from_data
    #Видаляє рецепт з файлика
  end

  def edit_recipe
    #Редагування
  end

  def hash_to_obj
    arg = load
    id = 'id'
    name = 'name'
    ingredients = 'ingredients'
    # description = 'description'
    recipe_list = arg.map do |hash|
      recipe = Recipe.new(hash[id], hash[name], hash[ingredients]) #, hash[description])
      recipe
    end
    @recipe_list_obj = recipe_list
  end

  def add_recipe
    puts 'Enter name of recipe '
    name = gets.chomp
    puts "Enter a name of ingredients with use coma \",\""
    ingredients = gets.chomp.split(", ")
    puts 'Enter a description of the recipe'
    description = gets.chomp
    reciper = { 'name' => name, 'rname' => ingredients, 'descrip' => description }
    # File.open(@file_name, "a") do |file|
    #   file.write "#{hash_of_recipe} \n "
    # end.
    reciper.save_helper
  end
end

DATA = RecipeStore.new
# RECIPE = CreateRecipe.new

