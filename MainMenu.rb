load './Search.rb'
require './Fridge.rb'
require './recipe_act.rb'
require './recipe_store.rb'

class Menu_main
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
        Recipe.menu
      when '2'
        Fridge.menu
      when '3'
        Search.menu
      else
        error_text
      end
    end
  end
  def self.error_text
    puts "*" * 24
    puts format("| %12s | ",  "Enter correct number" )
    puts "*" * 24
  end
end

Menu_main.main
