
class Person
  attr_accessor :name, :age, :from, :money
  def initialize
    puts "Welcome! Lets get started!"
    puts "What is your name?"
    @name = gets.strip
    puts "How old are you?"
    @age = gets.strip.to_i
    puts "Where are you from?"
    @from = gets.strip
    puts "How much money did you bring today? (100, 23, 250 etc.)"
    @money = gets.strip.to_i
  end
end
