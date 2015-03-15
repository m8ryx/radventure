class Player
  def initialize()
    @score = 0
    @round = 0
    @room = 3
    @inventory = []
    @playing = true
    @living = true
    @verbose = false
    shirt = Thing.new("shirt", "A worn-out T-shirt",true,false,false,false,false,true)
    trousers = Thing.new("trousers", "a dirty pair of trousers",true,false,false,false,false,true)
    shoes = Thing.new("Nike's", "some badass Nike's",true,false,false,false,false,true)
    @wearing = [shirt,trousers,shoes]
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
    return true
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
  def addScore(points)
    score = getScore()
    score = score + points
    setScore(score)
  end
  def getRoom()
    return @room
  end
  def getInventory()
    return @inventory
  end
  def takes(objects,room)
    objects.each do |object|
      if room.hasItem?(object)
        room.loses(object)
        @inventory.push(object)
      else
        puts "That's not available to take"
      end
    end
  end
  def stopPlaying
    @playing = false
    showGameStats()
  end
  def drops(objects,room)
    tmpThings = Array.new
    objects.each do |object|
      @inventory.each do |item|
        if item == object
          tmpThings.push(object)
          @inventory.delete_if { |content| content == object }
          room.gains(object)
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
    wearing
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
  def wear(item)
    if player.has(item)
      if item.wearble?
        @wearing.push(item)
      else
        puts "You can't wear #{item.name}!"
      end
    else
      puts "You need to have that first!"
    end
  end
  def wearing
    if @wearing.length > 0
      puts "You are wearing "
      @wearing.each do |clothes|
        print "#{clothes.name}, "
      end
    else
      print "You're naked as a babe"
    end
  end
  def has
    return @wearing + @inventory
  end
end

