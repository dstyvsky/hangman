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
		@attempts = 1
		@incorrect_guess = []
	end

	def read_line_number(filename, number)
	  return nil if number < 1
	  line = File.readlines(filename)[number-1]
	  line ? line.chomp : nil
	end

	def show
		@hidden_word.join('')
	end

	def guess(guess)
		found_it = false
		@hidden_word.each_with_index do |letter, index|
			if guess.upcase == letter.upcase
				@guessing_status[index] = "#{letter}"
				found_it = true
			end
		end
		if found_it == false
			@incorrect_guess << guess
			@attempts += 1
		end
		$game_on = false if @hidden_word == @guessing_status
		system('clear')
		puts "Game Status: #{@guessing_status.join(' ')}  Incorrect guesses: #{@incorrect_guess.join(' ')}"
	end

	def start_guessing_status
		@guessing_status = []
		for i in 0..(@hidden_word.length-1)
			@guessing_status << "_"
		end
		starting_line = @guessing_status.join(' ')
	end

	def saves_attempts(attempts)
		@attempts = attempts
	end

	def check_attempts
		@attempts
	end

	def show_guessing_status
		puts "Game Status: #{@guessing_status.join(' ')}  Incorrect guesses: #{@incorrect_guess.join(' ')}"
	end

end