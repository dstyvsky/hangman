class Game
	def initialize		
		filename = "5desk.txt"
		line_count = `wc -l "#{filename}"`.strip.split(' ')[0].to_i
			@hidden_word = []
		while(@hidden_word.length < 5 || @hidden_word.length > 12)
			random_line = rand(line_count+1)
			@hidden_word = read_line_number(filename, random_line).split('')
		end
		start_guessing_status
	end

	def read_line_number(filename, number)
	  return nil if number < 1
	  line = File.readlines(filename)[number-1]
	  line ? line.chomp : nil
	end

	def show
		puts @hidden_word.join('')
	end

	def guess
		puts @guessing_status.join(' ')
		puts
		puts "Enter the number \"1\" to save"
		print "Or guess a letter: "
		guess = gets.chomp

		if guess == 1
			File.open('save_game.txt', 'w') {|f| f.write(YAML.dump(first))}
			
		end

		@hidden_word.each_with_index do |letter, index|
			if guess.upcase == letter.upcase
				@guessing_status[index] = "#{letter}"
			end
		end
		$game_on = false if @hidden_word == @guessing_status
		system('clear')
	end

	def start_guessing_status
		@guessing_status = []
		for i in 0..(@hidden_word.length-1)
			@guessing_status << "_"
		end
		starting_line = @guessing_status.join(' ')
	end
		
end