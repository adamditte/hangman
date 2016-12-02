class Hangman

    attr_accessor :bad_guesses, :word, :used_letters, :spaces

    def initialize(word)

	    (@word = word).downcase!
			@spaces = "_" * word.length
			@bad_guesses = 10
			@used_letters = []
    end

    def used_letters?(guess)
			@used_letters.include? guess 
    end

    def update_letters(guess)
			@used_letters << guess
    end

	def bad_guess(guess)
			@bad_guesses -= 1
	end

  	def good_guess?(guess)
			correct = false
			@word.scan(/\w/) do |letter|
			letter == guess ? correct = true : false
					end
			correct 
	end

	def insert_letter(guess)
	(0...@word.length).zip(@word.scan(/\w/)) do |index,letter|
		  letter == guess ? @spaces[index] = letter : false
		end
		@spaces
	end

	def show_guessed_letters
		@used_letters.sort.join(", ")
	end

	def show_board
		@spaces.scan(/_|\w/).join(' ')
	end
		
	def make_move(guess)
		update_letters(guess)
		if good_guess?(guess)
			insert_letter(guess)
		else
			bad_guess
		end
	end
	
	def loser?
		@bad_guesses == 0
	end

	def winner?
		@word == @spaces
	end

end