class Hangman

    attr_accessor :bad_guesses, :word, :used_letters, :spaces

    def initialize(word)

	    (@word = word).downcase!
		@spaces = "_" * word.length
		@bad_guesses = 10
		@used_letters = []
    end

    def used_letters?(choice)
		@already_guessed.include? choice 
    end
end