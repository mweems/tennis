class Tennis

  def initialize
    #@called_score = false
    @score = [[0,0]]
  end
  
  def get_current_game_score
    @score

    #score_point
    
    # @count += 1
    # if @count == 1
    #   puts "----------#{@count}-------"
    #   @score = [[0,0]]
    # else
    #   @score = [[0,0],[15,0]]
    # end
  end

  def get_round_score(round)
    get_current_game_score[round]
  end

  def score_point(player )# = "bob")
    #@called_score = true

    @score << @score[-1] + [15,0]
    2.times{@score[-1].shift}
    @score
    

    # if player == "Bob" && @score.length == 1
    #   puts "------in if------"
    #   @score
    # else
    #   @score << @score[-1] + [15,0]
    #   2.times{@score[-1].shift}
    #   puts "-----#{@score}-------"
    # end

    # @count += 1
    # puts "++++++++++++++#{@count}+++++++++"
    # @new_score = [[0,0],[15,0]]
  end

end