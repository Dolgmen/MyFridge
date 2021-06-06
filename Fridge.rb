require 'json'
require './file'

class Fridge
  attr_accessor :ingredients

  def initialize
    @file_name = 'fridge.json'
  end

  def show_ingredients
    puts @ingredients
  end

  def append(name, quantity)
    if @ingredients.has_key?(name)
      @ingredients[name] += quantity
    elsif @ingredients[name] = quantity
    end
  end

  def to_json
    p @ingredients
    @ingredients.to_json
  end

  def save
    text = to_json
    MyFile::File_.write(@file_name, text)
  end
  def load
    begin
      @ingredients = JSON.parse(MyFile::File_.read(@file_name))
    rescue
      @ingredients = {}
    end
  end
  def self.menu
    while true

      puts '1. Add ingredient into a fridge'
      puts '2. Show ingredients into FRIDGE'
      puts ''
      puts '0. Back'

      puts 'Enter a number '
      user_input = gets.chomp
      case user_input
      when '0'
        FRIDGE.save
        Menu.main
      when '1'
        add_ingredient
      when '2'
        FRIDGE.show_ingredients
      end
    end
  end

end
def add_ingredient
  puts 'Enter a name of ingredient'
  name_input = gets.chomp
  puts 'Enter a quantity of ingredient'
  quantity_input = gets.chomp.to_f
  FRIDGE.append(name_input, quantity_input)
end
FRIDGE = Fridge.new
FRIDGE.load

