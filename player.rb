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
  def drops(objects,room)
    object.each do |thing|
      tempThing = @inventory.select { |object| object == "thing" }
      if tempThing.length > 0 
        room.gains(thing)
      else
        puts "You don't have any #{thing}"
      end
    end
  end
  def takes(objects,room)
    tempThings = room.loses(objects)
    if tempThings.length > 0
      tempThings.each do |thing|
        @inventory.push(thing)
      end
    else
      puts "That's not available to take"
    end
  end
  def stopPlaying
    @playing = false
    showGameStats()
  end
  def drops(objects,room)
    tmpThings = Array.new
    objects.each do |thing|
      @inventory.each do |item|
        if item.name == thing
          tmpThings.push(item)
          @inventory.delete_if { |content| content == item }
          room.gains(item)
        end
      end
    end
  end
  def inventory
    puts "You are carrying..."
    if @inventory.length > 0
      @inventory.each do |item|
        puts item.name
      end
    else
      puts "nothing. nothing at all"
    end
  end
end

