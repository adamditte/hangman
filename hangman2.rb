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

    def good_guess?(guess)
        word_include?(guess) == true
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

    def show_board
        @blanks.scan(/_|\w/).join(' ')
    end

    def show_guessed_letters
        @guessed_letters.sort.join(", ")
    end

    def bad_guess(guess)
        if word_include?(guess) == false
          @chances -= 1
        end
          chances
    end

    def choose_letter(guess)
        make_guess(guess)
        if good_guess?(guess)
            update_blanks(guess)
        else
            bad_guess(guess)
        end
    end

    def winner?
      @blanks == word
    end

    def loser?
        @chances == 0       
    end
end