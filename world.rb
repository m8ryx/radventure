class World
  def initialize()
    @startRoom = 3
    @room = Array.new
    @roomsName = ['cottage','Dragon Tower', 'south of the tower', 'north of the tower']
    @roomsDesc = ["You are inside the cottage.  You can leave to the north or south, or the tower is attached to the east.\nThis room has seen better days.  Dusty furniture lies in varying states of decay and disarray.  Large webs drape the corners, and several dead giant spiders are visible.", "You are inside the dragon's tower.  Maybe not the most awesome place to be.  There are steps running along the permiter of the tower up to the top, some 40 feet above.","You are to the south of the cottage.  You can enter to the north or run away.", "You are to the north of the cottage.  You can enter to the south or run away"]
    @roomsData = Array.new
    @roomsData.push(["cottage","You are inside the cottage.  You can leave to the north or south, or the tower is attached to the east.\nThis room has seen better days.  Dusty furniture lies in varying states of decay and disarray.  Large webs drape the corners, and several dead giant spiders are visible.",['100 gold'],[3,2,1,-1,-1,-1]])
    @roomsData.push(['Dragon Tower',"You are inside the dragon's tower.  Maybe not the most awesome place to be.  There are steps running along the permiter of the tower up to the top, some 40 feet above.",["axe"],[-1,-1,-1,0,-1,-1]])
    @roomsData.push(["South of the cottage", "You are to the south of the cottage.  You can enter to the north or run away.", ['piece of thread'],[0,-1,-1,-1,-1,-1]])
    @roomsData.push(["North of cottage", "You are to the north of the cottage.  You can enter to the south or run away",["pocket lint"],[-1,0,-1,-1,-1,-1]])
    # each room has an array inside this 2-d array, N, S, E, W, U, D, -1 for no path, otherwise room id

    @roomsExits = [[3,2,1,-1,-1,-1],[-1,-1,-1,0,-1,-1],[0,-1,-1,-1,-1,-1],[-1,0,-1,-1,-1,-1]]
    @stuff = [['100 gold'],['axe'],['piece of thread','Timbers Jersey'],['pocket lint']]
    id = 0
    @roomsName.each do |room|
      @room[id] = Room.new(id,@roomsData[id][0],@roomsData[id][1],@roomsData[id][2],@roomsData[id][3])
      id = id + 1
    end
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
  def thisRoom(roomID)
    return @room[roomID]
  end
end #World
