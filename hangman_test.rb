require "minitest/autorun"

require_relative "hangman.rb"

class TestHangman < Minitest::Test

    def test_create_new_game_of_hangman
			game = Hangman.new("BEER")
			assert_equal("beer", game.word)
    end

    def test_to_see_if_used_letter_gets_used
    	game = Hangman.new("gAmes")
			choice = "a"
			game.used_letters = ["a"]
			assert_equal(true, game.used_letters?(choice))
    end

    def test_check_to_see_if_empty_array_returns_false
			game = Hangman.new("gAmes")
			choice = "a"
			game.used_letters = []
			assert_equal(false, game.used_letters?(choice))
    end

    def test_that_bad_guess_letter_goes_into_used_letters_array
			game = Hangman.new("gAmes")
			game.used_letters = ["a"]
			choice = "b"
			assert_equal(["a","b"], game.update_letters(choice))
    end
		
		def test_create_correct_number_of_spaces_for_word
			game = Hangman.new("superman")
			assert_equal("________", game.spaces)
		end

		def test_for_guess_that_includes_correct_letter
			



end