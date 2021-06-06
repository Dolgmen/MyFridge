require 'json'
require './file'

class Fridge
  attr_accessor :ingredients

  def initialize
    @file_name = 'fridge.json'
  end

  def show_ingredients_fridge
    puts @ingredients
  end

  def append_quantity(name, quantity)
    if @ingredients.has_key?(name)
      @ingredients[name] += quantity
    elsif @ingredients[name] = quantity
    end
  end

  def convert_to_json
    p @ingredients
    @ingredients.to_json
  end

  def save_fridge_file
    text = convert_to_json
    File_::FileHelper.write(@file_name, text)
  end

  def load_fridge_file
    begin
      @ingredients = JSON.parse(File_::FileHelper.read(@file_name))
    rescue
      @ingredients = {}
    end
  end

  def self.menu_of_fridge
    while true

      puts '1. Add ingredient into a fridge'
      puts '2. Show ingredients into FRIDGE'
      puts ''
      puts '0. Back'

      puts 'Enter a number '
      user_input = gets.chomp
      case user_input
      when '0'
        $FRIDGE.save_fridge_file
        Menu_main.general_main
      when '1'
        add_ingredient_fridge
      when '2'
        $FRIDGE.show_ingredients_fridge
      end
    end
  end

end

def add_ingredient_fridge
  puts 'Enter a name of ingredient'
  name_input = gets.chomp
  puts 'Enter a quantity of ingredient'
  quantity_input = gets.chomp.to_f
  $FRIDGE.append_quantity(name_input, quantity_input)
end

$FRIDGE = Fridge.new
$FRIDGE.load_fridge_file

