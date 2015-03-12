def getInput
  print "> "
  choice = $stdin.gets.chomp
  return choice
end

class World
  def initialize()
    @roomsName = ['cottage','Dragon Tower', 'south of the tower', 'north of the tower']
    @roomsDesc = ["You are inside the cottage.  You can leave to the north or south, or the tower is attached to the east.\nThis room has seen better days.  Dusty furniture lies in varying states of decay and disarray.  Large webs drape the corners, and several dead giant spiders are visible.", "You are inside the dragon's tower.  Maybe not the most awesome place to be.  There are steps running along the permiter of the tower up to the top, some 40 feet above.","You are to the south of the cottage.  You can enter to the north or run away.", "You are to the north of the cottage.  You can enter to the south or run away"]
    # each room has an array inside this 2-d array, N, S, E, W, U, D, -1 for no path, otherwise room id
    @roomsExits = [[3,2,1,-1,-1,-1],[-1,-1,-1,0,-1,-1],[0,-1,-1,-1,-1,-1],[-1,0,-1,-1,-1,-1]]
    @stuff = [['100 gold'],['axe'],['piece of thread','Timbers Jersey'],['pocket lint']]
  end
  def showRoom(roomID)
    puts @roomsName[roomID]
    puts @roomsDesc[roomID]
    puts "You see"
    showStuff(roomID)
  end
  def getRoomName(roomID)
    return @roomsName[roomID]
  end
  def showStuff(roomID)
    @stuff[roomID].each do |thing|
      puts thing
    end
  end
  def getStuff(roomID)
    return @stuff[roomID]
  end
  def getDestination(roomID,direction)
#    return @roomExits[roomID][direction]
    return @roomsExits[roomID][direction]
  end
  def go(roomID,direction,player)
    destination = getDestination(roomID,direction)
    if destination >= 0 then
      player.setRoom(destination)
    else puts "You can't go that way"
    end
  end
end #World

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
    return @room
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
end #Player

class Activity
  def initialize(sentence)
    @verbs = ['n','s','e','w','u','d','take','get','drop','i','inventory','look','quit']
    return(sentence)
  end
  def split(sentence)
    words = sentence.split(' ')
    return words
  end
  def findVerb(thisVerb)
    myVerb = ""
    # this just validates that it's actually a verb!!
    @verbs.each do |verb|
      myVerb = thisVerb if verb == thisVerb
    end
    if myVerb == ""
      puts "That's not a verb I recognize"
      return 0
    else
      return thisVerb
    end
  end
  def findObject(sentence, stuffHere)
    thisStuff = []
    words = split(sentence)
    words.each do |word|
      stuffHere.each do |stuff|
        thisStuff.push(stuff) if word == stuff
      end
    end
    # this is probably not true
    if thisStuff.length > 1
      puts "Only one object please"
      return 0
    end
  end
  def doAction(verb,objects,myRoom,myStuff,roomStuff,myWorld,me)
    case
      when verb == "n"
        myWorld.go(myRoom,0,me)
      when verb == "s"
        puts "going south"
        myWorld.go(myRoom,1,me)
      when verb == "e"
        myWorld.go(myRoom,2,me)
      when verb == "w"
        myWorld.go(myRoom,3,me)
      when verb == "u"
        myWorld.go(myRoom,4,me)
      when verb == "d"
        myWorld.go(myRoom,5,me)
      when verb == "quit"
        me.stopPlaying(me)
    end
  end
end

player = Player.new()
world = World.new()

while player.playing?
  myRoom = player.getRoom
  puts "=========== Score: #{player.getScore} ====== Room: #{myRoom} - #{world.getRoomName(myRoom)} ===== Round: #{player.getRound} ======="
  world.showRoom(myRoom)
  action = getInput()

  activity = Activity.new(action)
  sentence = activity.split(action)
  myInventory = player.getInventory()
  verb = activity.findVerb(sentence.shift())
  objects = activity.findObject(action,world.getStuff(myRoom))
  roomStuff = world.getStuff(myRoom)

  activity.doAction(verb,objects,myRoom,myInventory,roomStuff,world,player)
  puts verb
  #puts object
#  player.addScore(1,player)
  player.incrementRound
end
