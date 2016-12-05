require "minitest/autorun"

require_relative "hangman.rb"

class TestHangman < Minitest::Test

    def test_create_new_game_of_hangman
			game = Hangman.new("BEER")
			assert_equal("beer", game.word)
    end

    def test_to_see_if_used_letter_gets_used
    	game = Hangman.new("gAmes")
			guess = "a"
			game.used_letters = ["a"]
			assert_equal(true, game.used_letters?(guess))
    end

    def test_check_to_see_if_empty_array_returns_false
			game = Hangman.new("gAmes")
			guess = "a"
			game.used_letters = []
			assert_equal(false, game.used_letters?(guess))
    end

    def test_that_bad_guess_letter_goes_into_used_letters_array
			game = Hangman.new("gAmes")
			game.used_letters = ["a"]
			guess = "b"
			assert_equal(["a","b"], game.update_letters(guess))
    end
		
		def test_create_correct_number_of_spaces_for_word
			game = Hangman.new("superman")
			assert_equal("________", game.spaces)
		end

		def test_for_correct_letter_returns_true_on_good_guess
			game = Hangman.new("superman")
			guess = "p"
			assert_equal(true, game.good_guess?(guess))
		end

		def test_for_incorrect_letter_returns_false_on_good_guess
			game = Hangman.new("superman")
			guess = "z"
			assert_equal(false, game.good_guess?(guess))
		end

		def test_for_guessed_letters_sorted_into_array
			game = Hangman.new("superman")
			game.used_letters = ["s","e","w","a","p"]
			assert_equal("a, e, p, s, w", game.show_guessed_letters)
		end

		def test_update_spaces_with_correct_guessed_letter
			game = Hangman.new("superman")
			guess = "p"
			assert_equal("__p_____", game.insert_letter(guess))
		end

		def test_update_multiple_spaces_with_multiple_correct_guess
			game = Hangman.new("mississippi")
			guess = "s"
			assert_equal("__ss_ss____", game.insert_letter(guess))
		end

		def test_do_not_update_board_with_incorrect_guess
			game = Hangman.new("dog")
			guess = "z"
			assert_equal("___", game.insert_letter(guess))
		end

		def test_bad_guess_takes_chance_away
			game = Hangman.new("dog")
			guess = "z"
			assert_equal(9, game.bad_guess(guess))
		end
		
		def test_show_board_returns_string_with_spaces
			game = Hangman.new("dragon")
			game.spaces = ("dr__on")
			assert_equal("d r _ _ o n", game.show_board)
		end

		def test_winner_if_all_letters_guessed_correctly
			game = Hangman.new("dragon")
			game.spaces = ("dragon")
			assert_equal(true, game.winner?)
		end

		def test_loser_if_guesses_used_up
			game = Hangman.new("dog")
			@bad_guesses = 1
			make_move("b")
			assert_equal(true, game.loser?)
		end
		# def test_loser_if_guesses_used_up
		# 	game = Hangman.new("dog")
		# 	game.bad_guesses = 1
		# 	guess = "b"
		# 	assert_equal(true, game.loser?)
		# end

		# def test_winner_if_all_letters_guessed_correctly
		# 	game = Hangman.new("dog")
		# 	game.spaces = "dog"
		# 	assert_equal(true, game.winner?)
		# end

		# def test_good_guess_does_not_take_away_guess
		# 	game = Hangman.new("dog")
		# 	game.bad_guesses = 1
		# 	guess = "d"
		# 	assert_equal(1, game.good_guess?(guess))
		# end

end