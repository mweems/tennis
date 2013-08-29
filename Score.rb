class Score

  def initialize
    @total_score = [[0,0]]
  end

  def game_score
    @total_score
  end

  def round_score(round)
    @total_score[round]
  end

  def update_score(player)
    #@total_score = @total_score
    @total_score << @total_score[-1] + [15,0]
    @total_score[-1].shift
    @total_score[-1].shift
  end
end