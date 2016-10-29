
def slots_menu
  puts "\nWelcome to the SLOTS!"
  puts "Make yourself comfortable, you could be here awhile!"
  puts "1: Play Slots"
  puts "2: Cash Out"
  puts "3: Exit"
  case gets.strip
  when "1", "play", "slots", "play slots"
    puts "\nLets Begin!"
    puts "MAY THE ODDS BE IN YOUR FAVOR!"
    slots_initial_coins
  when "2", "cash", "out", "cash out"
    slots_cash_out
  when "no", "n"
    puts "Come back later!"
    ruby_casino_menu
  else
    puts "Invalid Selection, type yes or no."
    slots_menu
  end
end

def slots_initial_coins
  puts "\n\nBefore you begin you will need to buy a few coins."
  puts "Each coin costs $2."
  puts "You have $#{@player_1.money}."
  puts "How many coins would you like to buy?"
  @slot_coins = gets.strip.to_i
  if @slot_coins * 2 > @player_1.money
    puts "You dont have enough money for that many coins!"
    slots_initial_coins
  else
    @player_1.money -= @slot_coins * 2
  end
  puts "\n\nThat will be $#{@slot_coins * 2}."
  puts "\n~~~~ Money Received ~~~~"
  puts "\nYou have $#{@player_1.money} left."
  puts "\nThank You, Lets get going!"
  slots_begin
end

def slots_begin
  puts "\nYou have #{@slot_coins} coins."
  if @slot_coins == 0
    puts "\nYou are out of coins!"
    buy_more
  else
  end
  puts "Your goal is to get all 3 numbers the same each time you pull the lever."
  puts "Each LEVER PULL will cost 1 coin."
  puts "Pull the Lever? yes or no? Saying no will take you back to Main Menu."
  lever_pull = gets.strip.downcase
  case lever_pull
  when "yes", 'y'
    slots_result
  when "no"
    puts "Thanks for playing!"
    slots_menu
  else
    puts "Invalid Selection"
    slots_begin
  end
end


def buy_more
  puts "\nBuy more coins? yes or no"
  case gets.strip.downcase
  when "yes", "y"
    puts "How many more coins would you like to buy? $2 each."
    selection = gets.strip.to_i
    puts "\nThat will be $#{selection * 2}!"
    puts "\n~~~~ Money Received ~~~~"
    if selection * 2 > @player_1.money
      puts "You don't have enough money for that many coins!"
      buy_more
    else
      @slot_coins = selection
      @player_1.money -= @slot_coins * 2
      slots_begin
    end

  when "no", "n"
    puts "\nToday isn't your day huh?"
    puts "Maybe you'll have better luck back in #{@player_1.from}!"
    puts "\nWe hope to take your money ..ermm... see you again!"
    slots_menu
  else
  end
end

def slots_result
  puts "\nSpinning..."
  puts
  roll
  print @roll_array
  if @roll_array.uniq.count == 1
    puts "\n\nding ding ding JACKPOT!!!"
    puts "\nYou won 1000 coins!"
    @slot_coins = (@slot_coins + 1000)
    slots_cash_out
    # puts "cash out while your ahead? yes or no"
    # case gets.strip.downcase
    # when "yes"
    #   cash_out_yes
    # when "no"
    #   slots_begin
    # else
    #   puts "Invalid Selection"
    #   cash_out
    # end
  else
    puts "\n\nAhhh!"
    puts "\nBetter luck next time!"
    @slot_coins = (@slot_coins - 1)
    slots_begin
  end

end

def roll()
  @roll_array = []
  3.times do
    roll_value = rand(4) + 1
    @roll_array << roll_value
  end
  # #total = 0
  # roll_array.each do |roll|
  #   new_total = total + roll
  #   total = new_total
  # end
  # total
end

def slots_cash_out
  puts "\n\n\ncash out while your ahead? yes or no"
  case gets.strip.downcase
  when "yes", 'y'
    slots_cash_out_yes
  when "no"
    slots_begin
  else
    puts "Invalid Selection"
    slots_cash_out
  end
end

def slots_cash_out_yes
  puts "\n\nYou finished with #{@slot_coins} coins."
  puts "Wow! You made a KILLING!"
  puts "Here you go...."
  if @slot_coins > 0
    puts "\nYou received $#{@slot_coins * 2}!"
    @player_1.money = (@player_1.money + @slot_coins * 2)
    @slot_coins = 0
    puts "You have $#{@player_1.money}."
    puts "\nCome Again!"
    slots_menu
  else
    puts "You received $0 because you had no coins!"
    slots_menu
  end
end
