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

		def test_for_correct_letter_returns_true_on_good_guess
			game = Hangman.new("superman")
			choice = "p"
			assert_equal(true, game.good_guess?(choice))
		end

		def test_for_incorrect_letter_returns_false_on_good_guess
			game = Hangman.new("superman")
			choice = "z"
			assert_equal(false, game.good_guess?(choice))
		end

		def test_for_guessed_letters_sorted_into_array
			game = Hangman.new("superman")
			game.used_letters = ["s","e","w","a","p"]
			assert_equal("a, e, p, s, w", game.show_guessed_letters)
		end

		def test_update_spaces_with_correct_guessed_letter
			game = Hangman.new("superman")
			choice = "p"
			assert_equal("__p_____", game.insert_letter(choice))
		end
end