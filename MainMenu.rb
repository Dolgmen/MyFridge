load './Search.rb'
require './Fridge.rb'

class Menu
  def self.main
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
        main1
      when '2'
        Fridge.menu
      when '3'
        Search.menu
      end
    end
  end

  def self.main1
    while true
      puts '1. Show all'
      puts '2. Search by Name'
      puts '3. Create recipe'
      puts '4. Show Favorites'
      puts '5. Back'

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

      when '4'
        DATA.all_recipes.each do |recipe|
          if recipe.is_favorite == true
            puts "Recipe Name: #{recipe.name}, ID:#{recipe.id}"
          end
        end
        RecipeAct.id_from_user
      when '5'
        main
      end
    end
  end
end

Menu.main
