require "minitest/autorun"
require_relative "hangman2.rb"

class TestHangman2 < Minitest::Test

    def test_create_new_game
        game = Hangman2.new("beer")
        assert_equal("beer", game.word)
    end

    def test_number_of_blanks
        game = Hangman2.new("beer")
        assert_equal("____", game.blanks)
    end

    def test_if_guessed_letter_is_in_word
        game = Hangman2.new("beer")
        assert_equal(true, game.word_include?("b"))
        assert_equal(false, game.word_include?("z"))
    end

    def test_at_beginning_of_game_guessed_letters_array_is_empty
        game = Hangman2.new("beer")
        assert_equal([], game.guessed_letters)
    end

    def test_used_guessed_letter_gets_put_into_array
        game = Hangman2.new("beer")
        game.make_guess("a")
        game.make_guess("z")
        assert_equal(["a", "z"], game.guessed_letters)
    end

    def test_update_blanks
        game = Hangman2.new("beer")
        game.update_blanks("b")
        assert_equal("b___", game.blanks)
    end

    def test_update_multiple_blanks
        game = Hangman2.new("beer")
        game.update_blanks("e")
        game.update_blanks("b")
        assert_equal("bee_", game.blanks)
    end

    def test_winner_if_all_letters_guessed_match_word
        game = Hangman2.new("beer")
        game.update_blanks("b")
        game.update_blanks("e")
        game.update_blanks("r")
        assert_equal(true, game.winner?)
    end

    def test_for_number_of_chances_at_beginning_of_game
        game = Hangman2.new("beer")
        assert_equal(7, game.chances)
    end

    def test_for_chance_lost_on_bad_guess
        game = Hangman2.new("beer")
        game.bad_guess("z")
        assert_equal(6,game.chances)
    end

    def test_for_chances_to_zero_if_one_left
        game = Hangman2.new("beer")
        game.chances = 1
        game.bad_guess("z")
        assert_equal(0, game.chances)
    end

    def test_for_loser_if_all_chances_gone
        game = Hangman2.new("beer")
        game.chances = 1
        game.bad_guess("z")
        assert_equal(true, game.loser?)
    end

    def test_for_good_guess
        game = Hangman2.new("beer")
        guess = "b"
        assert_equal(true, game.good_guess?(guess))
    end

    def test_for_false_on_wrong_good_guess?
        game = Hangman2.new("beer")
        guess = "z"
        assert_equal(false, game.good_guess?(guess))
    end

    def test_chances_do_not_decrease_with_good_guess
        game = Hangman2.new("beer")
        game.bad_guess("b")
        assert_equal(7, game.chances)
    end

    def test_for_game_run_with_good_guess
        game = Hangman2.new("beer")
        game.choose_letter("b")
        assert_equal("b___", game.blanks)
    end

    def test_for_game_run_with_bad_guess
        game = Hangman2.new("beer")
        game.choose_letter("z")
        assert_equal(6, game.chances)
    end
end

