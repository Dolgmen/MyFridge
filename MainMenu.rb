load './Search.rb'
require './Fridge.rb'
require './recipe_act.rb'
require './recipe_store.rb'

class Menu_main
  def self.general_main
    while true
      puts '1. Recipe'
      puts '2. Fridge'
      puts '3. Search recipe'
      puts '0. exit'

      puts 'Enter a number '
      user_input = gets.chomp
      case user_input
      when '0'
        exit
      when '1'
        menu_of_recipe
      when '2'
        Fridge.menu_of_fridge
      when '3'
        Search.menu_of_search
      end
    end
  end

  def self.menu_of_recipe
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
        DATA.all_recipes.each do |recipe|
          if recipe.is_favorite
            puts "Recipe Name: #{recipe.name}, ID:#{recipe.id}"
          end
        end
        RecipeAct.id_from_user
      when '0'
        general_main
      else
        puts "Enter correct number"
      end
    end
  end
end

Menu_main.general_main
