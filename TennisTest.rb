require_relative 'Tennis'
require 'test/unit'

class TennisTest < Test::Unit::TestCase

  def test_new_game_shows_beginning_score_as_0_0
    game = Tennis.new 
    assert_equal([[0,0]], game.get_current_game_score)
  end

  def test_get_round_score_returns_the_specified_rounds_score
    game = Tennis.new
    assert_equal([0,0], game.get_round_score(0))
    game.score_point('player1')
    assert_equal([15,0], game.get_round_score(1))
  end

  def test_player_one_score_gets_updated_when_player_one_scores
    game = Tennis.new
    game.score_point('player1')
    assert_equal([[0,0],[15,0]], game.get_current_game_score)
  end

  def test_player_two_score_gets_updated_when_player_two_scores
    game = Tennis.new
    game.score_point('player2')
    assert_equal([[0,0],[0,15]], game.get_current_game_score)
  end

  def test_score_adds_multiple_scores
    game = Tennis.new
    game.score_point('player1')
    game.score_point('player1')
    game.score_point('player2')
    assert_equal([[0,0],[15,0],[30,0],[30,15]], game.get_current_game_score)
  end

  def test_scoring_three_times_results_in_40_points
    game = Tennis.new
    game.score_point('player1')
    game.score_point('player1')
    game.score_point('player1')
    assert_equal([[0,0],[15,0],[30,0],[40,0]], game.get_current_game_score)
  end

  def test_scoring_four_times_results_in_winning
    game = Tennis.new
    game.score_point('player1')
    game.score_point('player1')
    game.score_point('player1')
    game.score_point('player1')
    assert_equal("player1", game.winning_player)
  end

  def test_both_players_scoring_40_results_in_duece
    game = Tennis.new
    game.score_point('player1')
    game.score_point('player1')
    game.score_point('player1')
    game.score_point('player2')
    game.score_point('player2')
    game.score_point('player2')
    assert_equal([[0,0],[15,0],[30,0],[40,0],[40,15],[40,30],['deuce']], game.get_current_game_score)
  end

  def test_player_doesnt_win_on_first_score_after_deuce
     game = Tennis.new
    game.score_point('player1')
    game.score_point('player1')
    game.score_point('player1')
    game.score_point('player2')
    game.score_point('player2')
    game.score_point('player2')
    game.score_point('player1')
    assert_equal('', game.winning_player)
  end
end