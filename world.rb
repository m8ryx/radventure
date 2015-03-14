class World
  def initialize()
    @startRoom = 3
    @room = Array.new
    @item = Array.new
#    @roomsName = ['cottage','Dragon Tower', 'south of the tower', 'north of the tower']
#    @roomsDesc = ["You are inside the cottage.  You can leave to the north or south, or the tower is attached to the east.\nThis room has seen better days.  Dusty furniture lies in varying states of decay and disarray.  Large webs drape the corners, and several dead giant spiders are visible.", "You are inside the dragon's tower.  Maybe not the most awesome place to be.  There are steps running along the permiter of the tower up to the top, some 40 feet above.","You are to the south of the cottage.  You can enter to the north or run away.", "You are to the north of the cottage.  You can enter to the south or run away"]
    @roomsData = Array.new
    @roomsData.push(["cottage","You are inside the cottage.  You can leave to the north or south, or the tower is attached to the east.\nThis room has seen better days.  Dusty furniture lies in varying states of decay and disarray.  Large webs drape the corners, and several dead giant spiders are visible.", [3,2,1,-1,-1,-1]])
    @roomsData.push(['Dragon Tower',"You are inside the dragon's tower.  Maybe not the most awesome place to be.  There are steps running along the perimiter of the tower up to the top, some 40 feet above.",[-1,-1,-1,0,-1,-1]])
    @roomsData.push(["South of the cottage", "You are to the south of the cottage.  You can enter to the north or run away." ,[0,-1,-1,-1,-1,-1]])
    @roomsData.push(["North of cottage", "You are to the north of the cottage.  You can enter to the south or run away", [-1,0,-1,-1,-1,-1]])
    # each room has an array inside this 2-d array, N, S, E, W, U, D, -1 for no path, otherwise room id

#    @roomsExits = [[3,2,1,-1,-1,-1],[-1,-1,-1,0,-1,-1],[0,-1,-1,-1,-1,-1],[-1,0,-1,-1,-1,-1]]
#    @stuff = [['100 gold'],['axe'],['piece of thread','Timbers Jersey'],['pocket lint']]
    id = 0
    @roomsData.each do |room|
      @room[id] = Room.new(id,@roomsData[id][0],@roomsData[id][1],@roomsData[id][2])
      id = id + 1
    end
    # items: [description, start room, takeable, eatable, drinkable, usable, switchable, wearable]
    @itemsData = Array.new
    @itemsData.push([0,"100 gold","some shiny bits",true , false, false, false, false, false])
    @itemsData.push([1,"axe", "A dull axe.  Engraved with words: don't be crazy", true, false, false, true, false, false])
    @itemsData.push([2,"piece of thread","useful for sewing buttons", true, false, false, true,false, false])
    @itemsData.push([2,"Timbers Jersey","The jersey of a great squad. RCTID",true, false, false, false, false,true])
    @itemsData.push([3,"pocket lint", "Useful for hitchhiking", true, false , false, false, false, true])
    id = 0
    @itemsData.each do |item|
      thisRoom = @itemsData[id][0]
      puts "Item ID: #{id} - Room: #{thisRoom}"
      @item[id] = Thing.new(@itemsData[id][1],@itemsData[id][2],@itemsData[id][3],@itemsData[id][4],@itemsData[id][5],@itemsData[id][6],@itemsData[id][7],@itemsData[id][8])
      @room[thisRoom].contains(@item[id])
      id = id + 1
      puts "End end Item add"
    end
  end
#  def showRoom(roomID)
#    puts @roomsName[roomID]
#    puts @roomsDesc[roomID]
#    puts "You see"
#    showStuff(roomID)
#  end
  def getRoomName(roomID)
    return @roomsName[roomID]
  end
  def go(room,direction,player)
    destination = room.destination(direction)
    if destination >= 0 then
      player.setRoom(destination)
    else puts "You can't go that way"
    end
  end
  def thisRoom(roomID)
    return @room[roomID]
  end
end #World
