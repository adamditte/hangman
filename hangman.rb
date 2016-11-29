class Hangman

    attr_accessor :bad_guesses, :word, :used_letters, :spaces

    def initialize(word)

	    (@word = word).downcase!
			@spaces = "_" * word.length
			@bad_guesses = 10
			@used_letters = []
    end

    def used_letters?(choice)
			@used_letters.include? choice 
    end

    def update_letters(choice)
			@used_letters << choice
    end

  	def good_guess?(choice)
			correct = false
			@word.scan(/\w/) do |letter|
			letter == choice ? correct = true : false
					end
			correct 
	end
end