load './Recipe.rb'
require './Fridge.rb'

class Search
  def self.menu_of_search
    while true
      puts '1. Search by friedge'
      puts '2. Search by ingredients'
      puts '0. Back'
      puts ''
      puts 'Enter a number '
      user_input = gets.chomp
      case user_input
      when '1'
        Search.by(FRIDGE.ingredients.keys)
        RecipeAct.id_from_user
      when '2'
        Search.by(Search.ingredients_input)
        RecipeAct.id_from_user
      when '0'
        Menu_main.general_main
      end
    end
  end

  def self.ingredients_input
    puts('Set a ingredients, using comma betweуn')
    user_ingredients = gets.chomp
    user_ingredients = user_ingredients.split(/,/)
  end

  def self.name_input
    puts('Set a name')
    recipe_name = gets.chomp
  end

  def self.by(user_ing_list)
    recipe_data = DATA.all_recipes
    searched_recipe = recipe_data.find_all { |recipe| recipe.ingredients & user_ing_list != [] }
    searched_recipe.each { |recipe| puts "Recipe Name: #{recipe.name}, ID:#{recipe.id}" }
  end

  def self.by_name
    recipe_data = DATA.all_recipes
    recipe_name = name_input
    searched_recipe = recipe_data.find_all { |recipe| recipe.name == recipe_name }
    searched_recipe.each { |recipe| puts "Recipe Name: #{recipe.name}, ID:#{recipe.id}" }
  end
end



