require_relative 'game.rb'
require 'yaml'

def game_play(first)
	#first.show
	count = first.check_attempts
	$game_on = true
	game_has_been_saved = false
	while(count < 12 && $game_on == true)
		puts "Incorrect attempts thus far: #{count} out of 11"	
		puts
		puts "Enter the number \"1\" to save"
		print "Or guess a letter: "	
		guess = gets.chomp
		if guess == "1"
			first.saves_attempts(count)
			game_as_string = first.to_yaml
			#puts game_as_string
			File.open("save_game.txt", 'w') {|f| f.write(game_as_string)}
			$game_on = false
			puts "Game has been saved. Thanks for playing"
			game_has_been_saved = true
		else
			first.guess(guess)
		end
		count = first.check_attempts
	end
	if $game_on == true || count == 12
			puts "YOU LOSE: The word was #{first.show.upcase}! Press Enter to continue!"
			gets
	elsif game_has_been_saved == true
		puts
	else
		puts "YOU WIN: GOOD GUESSES: PRESS ENTER TO CONTINUE"
		gets
	end
end

initial_selection = 0
while(initial_selection != "3")
	system('clear')
	puts "Please enter the number of the selection you would like to make:"
	puts "1. Start a new game"
	puts "2. Load your previous game"
	puts "3. Exit"
	puts
	print "Choice: "
	initial_selection = gets.chomp

	if initial_selection == "1"
		first = Game.new
	elsif initial_selection == "2"
		reading_file = File.open("save_game.txt", 'r')
		first = YAML::load(reading_file)
	end
	if initial_selection == "1" || initial_selection == "2"
		system('clear')
		first.show_guessing_status
		game_play(first)
	end
end






