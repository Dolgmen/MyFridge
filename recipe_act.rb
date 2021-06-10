require './MainMenu.rb'
require 'json'
require './file'

class RecipeAct
  def self.id_from_user
    puts ''
    puts 'Puts Needed Recipe ID:'
    recipe_id_input = gets.chomp
    with_recipe(recipe_id_input)
  end

  def self.show_favorites
    DATA.all_recipes.each do |recipe|
      if recipe.favorite
        puts "Recipe Name: #{recipe.name}, ID:#{recipe.id}"
      end
    end
    RecipeAct.id_from_user
  end

  def self.with_recipe(recipe_id)
    recipe_id = recipe_id.to_i
    DATA.all_recipes[recipe_id - 1].show_recipe
    while true
      puts '1. Add to favorites'
      puts '2. Delete recipe'
      puts '0. Back to main'
      puts ''
      puts 'Enter a number '
      user_input = gets.chomp
      case user_input
      when '1'
        DATA.all_recipes[recipe_id - 1].favorite_change
        DATA.save_halper
        puts('Added to favorites')
      when '2'
        DATA.delete_from_data(recipe_id)
        puts('Delete Recipe')
      when '0'
        DATA.save_halper
        Menu_main.main
      else
        Menu_main.error_text
      end
    end
  end
end
