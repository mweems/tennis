class Tennis

  def initialize(output = STDOUT)
    @output = output
    @score = [[0,0]]
    @winning_player = ''
  end
  
  def get_current_game_score
    @score
  end

  def get_round_score(round)
    get_current_game_score[round]
  end

  def score_point(player)
    update_score(player)
    @output.print(deuce? ? 'deuce' : @score.last)
    winner(@winner) if @winner
    @score
  end

  def winner(player)
    @output.print "#{player} is the winner"
    @winning_player = player
  end

  def winning_player
    @winning_player
  end

  def deuce?
    @score.last == [40,40]
  end

  def update_score(player)
    scoring_player = player == 'player1' ? 0 : 1
    other_player = player == 'player1' ? 1 : 0

    new_score = @score.last[scoring_player] + 15 
    other_score = @score.last[other_player]
    if new_score == 45
      new_score = 40
    elsif new_score == 55 && !deuce?
      @winner = player
    end
      @new_scores = []
      @new_scores[scoring_player] = new_score
      @new_scores[other_player] = other_score
      @score << @new_scores
  end

end