class Tennis

  def initialize
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
    if @score[-1] == 'deuce' && player == 'player1'
      @score << ['advantage/-']
      return @score
    elsif @score[-1] == 'deuce' && player == 'player2'
      @score << ['-/advantage']
      return @score
    end

    if player == 'player1'
      new_score = @score[-1][0] + 15 
      other_score = @score[-1][1]
      if new_score == 45
        new_score = 40
      elsif new_score == 55
        winner('player1')
      end
      @score << [new_score,other_score]
    else
      new_score = @score[-1][1] + 15 
      other_score = @score[-1][0]
      if new_score == 45
        new_score = 40
      elsif new_score == 55
        winner('player2')
      end
      if new_score == 40 && other_score == 40
        @score << ['deuce']
      else 
        @score << [other_score,new_score]
      end
    end
  end

  def winner(player)
    print "#{player} is the winner"
    @winning_player = player
  end

  def winning_player
    @winning_player
  end

end