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



class RecipeStore
  attr_accessor :recipe_list_hash, :recipe_list_obj

  def initialize
    @file_name = 'recipe.json'
    @recipe_list_hash = load_db_file
    @recipe_list_obj = hash_to_obj
  end

  def all_recipes
    @recipe_list_obj
  end

  def generate_id
    @recipe_list_obj.count + 1
  end

  def load_db_file
    begin
      recipe_list_hash = JSON.parse(File_::File_Help.read(@file_name))
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

  def list_to_json
    @recipe_list_hash = obj_to_hash(@recipe_list_obj)
    @recipe_list_hash.to_json
  end

  def save_halper
    text = list_to_json
    File_::File_Help.write(@file_name, text)
  end

  def add_to_data(hash)
    @recipe_list_hash << hash
    hash_to_obj
    save_halper
  end

  def delete_from_data(id)
    @recipe_list_hash.delete_if { |x| x['id'] == id }
    hash_to_obj
    save_halper
  end

  def hash_to_obj
    arg = @recipe_list_hash
    recipe_list = arg.map do |hash|
      recipe = Recipe.new(hash['id'], hash['name'], hash['ingredients'], hash['description'], hash['is_favorite'])
    end
    @recipe_list_obj = recipe_list
  end
end

DATA = RecipeStore.new


