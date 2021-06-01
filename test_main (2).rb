require 'json'
require './file'

class CreateRecipe
  attr_accessor :reciper, :hiroc

  def initialize # (rname, name , quantity, description)
    @file_name2 = "kupa.json"
  end

  def add_recipe
    puts 'Enter name of recipe '
    rname = gets.chomp
    puts "Enter a name of ingredients with use coma \",\""
    iname =gets.chomp.split(", ")
    puts 'Enter a description of the recipe'
    description = gets.chomp
    hiroc = { 'name' => rname, 'rname' => iname, 'descrip' => description }
    File.open("kupa.json", "a") do |file|
      file.write "#{hiroc} \n "
      # hiroc +=1
    end
  end
end


def save
  hiroc = to_json
  MyFile::File_.write(@file_name2, hiroc)
end

def load
  begin
    @reciper = JSON.parse('kupa.json')
  rescue
    @reciper = {}
  end
end


def append(iname, quantity)
  if @hiroc.has_key?(iname, quantity)
    @hiroc[iname, quantity] += [iname, quantity]
  end
end

def show_recipe
  puts @reciper = (MyFile::File_.read('kupa.json'))
end
def main
  while true
    puts '1. Create recipe!'
    puts '2. Show Recipe!'
    puts '0. Exit'
    puts 'Enter a number '
    user_input = gets.chomp
    case user_input
    when '0'
      break
    when '1'
      CREATE.add_recipe
    when '2'
      show_recipe
    end
  end
end

# p @reciper = (MyFile::File_.read('kupa.json'))
CREATE = CreateRecipe.new
# CREATE.load
main
