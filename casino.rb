require 'pry'

require_relative 'player'
require_relative 'slots'


class Casino
  attr_accessor :name, :location, :minimum_age, :value
  def initialize(name, location, minimum_age, value)
    @name = name
    @location = location
    @minimum_age = minimum_age
    @value = value

  end
end

@player_1 = Person.new
@casino_1 = Casino.new("Ruby Casino", "Salt Lake City", 21, 1000)


#puts "Welcome to the #{@casino_1.name}!"

def greeting
  puts "\nWelcome to the wonderful world of Gambling!"
  puts "What Casino are we visiting today?"
  puts "1: #{@casino_1.name}"
  puts "2: Other Casino"
  selection = gets.strip.downcase
  case selection
  when "1", "ruby casino", "ruby"
    ruby_casino
  when "2"
  else
    "We dont have access to that Casino!"
    greeting
  end
end

def ruby_casino
  puts
  puts "~~~~~ Welcome to the #{@casino_1.name} #{@player_1.name}! ~~~~~"
  puts "\nWe are thrilled to have your money... I mean you!"
  if @player_1.age < @casino_1.minimum_age
    puts "\nOhh wait... Our minimum age at the #{@casino_1.name} is #{@casino_1.minimum_age}..."
    puts "\nCome back in #{@casino_1.minimum_age - @player_1.age} year(s)!"
    exit
  else
  end
  ruby_casino_menu
end

def ruby_casino_menu
  puts "Feeling Lucky?"
  puts "Where are we starting today?"
  puts
  puts "$$$ #{@casino_1.name} Games $$$"
  puts "1: Slots"
  puts "2: Poker"
  puts "3: Exit"
  puts "-- Make Selection --"
  selection = gets.strip.downcase
  case selection
  when "1", "slots"
    slots_menu
  when "2", "poker"
  when "3", "exit"
    puts "\nI hope you enjoyed your time at the #{@casino_1.name}!"
    puts "Come Again"
    greeting
  else
    puts "Invalid Selection, Please choose from the list above."
    ruby_casino_menu
  end
end



while true
  greeting
end
