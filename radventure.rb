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
end #World

class Player
  def initialize()
    @score = 0
    @room = 3
  end
  def getRoom()
    return @room
  end
  def setRoom(newRoom)
    @room = newRoom
  end
  def getScore()
    return @score
  end
  def getRoom()
    return @room
  end
end #Player

class Activity
  def initialize(sentence)
    @verbs = ['n','s','e','w','u','d','take','get','drop','i','inventory','look']
    return(sentence)
  end
  def split(sentence)
    words = sentence.split(' ')
    return words
  end
  def findVerb(sentence)
    theseVerbs = []
    words = split(sentence)
    words.each do |word|
      @verbs.each do |verb|
        theseVerbs.push(verb) if verb == word
      end
    end
    if theseVerbs.length > 1
      puts "Only one verb please"
      return 0
    elsif theseVerbs.length <1
      puts "That's not a verb I recognize"
      return 0
    else
      return theseVerbs[0]
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
end



player = Player.new()
world = World.new()
myRoom = player.getRoom

puts "=========== Score: #{player.getScore} ======  Room: #{world.getRoomName(myRoom)}========"
world.showRoom(myRoom)
action = getInput()

activity = Activity.new(action)
puts activity.split(action)

verb = activity.findVerb(action)
object = activity.findObject(action,world.getStuff(myRoom))
puts verb
puts object

