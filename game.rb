class Game
  def initialize
    @round = 0
    @score = 0
    @verbose = false
    @playing = true
  end
  def playing?
    return @playing
  end
  def getScore()
    return @score
  end
  def showGameStats
    puts "Great jorb!  You've accumulated #{getScore} points over #{getRound} rounds."
  end
  def getRound
    return @round
  end
  def incrementRound
    @round = @round + 1
  end
  def verbose
    @verbose = true
  end
  def sparse
    @verbose = false
  end
  def verbose?
    return @verbose
  end
  def stopPlaying
    @playing = false
    showGameStats()
  end
end
