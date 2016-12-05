class Hangman2
    attr_reader :word
    attr_accessor :blanks, :guessed_letters, :chances

    def initialize(word)
        @word = word
        @blanks = "_" * word.length
        @guessed_letters = []
        @chances = 7
    end

    def word_include?(guess)
        word.include?(guess)
    end

    def make_guess(guess)
        @guessed_letters << guess
    end

    def update_blanks(guess)
        i = 0
        word.length.times do
            if word[i] == guess
                @blanks[i] = guess
            end
            i += 1
        end
    end

    def bad_guess(guess)
        if word_include?(guess) == false
          @chances -= 1
        end
          chances
    end

    def winner?(blanks)
      blanks == word
    end

    def loser?(bad_guess)
      chances == 0
    end
end