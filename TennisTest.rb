require_relative 'Tennis'
require 'test/unit'

class TennisTest < Test::Unit::TestCase

  def game
    game = Tennis.new
  end

  def test_new_game_shows_beginning_score_as_0_0 
    assert_equal([[0,0]], game.get_current_game_score)
  end

  def test_game_displays_current_score
    assert_equal([0,0], game.get_round_score(0))
  end

  def test_total_score_gets_updated_when_a_player_scores
    game.score_point('player1')
    assert_equal([[0,0],[15,0]], game.get_current_game_score)
  end

end