require_relative 'game.rb'
system('clear')



first = Game.new
first.show

count = 0
$game_on = true
while(count < 12 && $game_on == true)
	count += 1
	puts "Attempts thus far: #{count} out of 12"
	first.guess

end





