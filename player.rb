class Player
  def initialize()
    @score = 0
    @round = 0
    @room = 3
    @inventory = []
    @playing = true
    @living = true
  end
  def getRoom()
    return room(@room)
  end
  def playing?
    return @playing
  end
  def kill(reason,player)
    puts reason
    puts "Bummmer!"
    stopPlaying(player)
  end
  def setRoom(newRoom)
    @room = newRoom
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
  def setScore(newScore)
    @score = newScore
  end
  def addScore(points,player)
    score = getScore()
    score = score + points
    player.setScore(score)
  end
  def getRoom()
    return @room
  end
  def getInventory()
    return @inventory
  end
  def stopPlaying(player)
    @playing = false
    player.showGameStats()
  end
end

