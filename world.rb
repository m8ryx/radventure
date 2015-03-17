class World
  def initialize
    @start_room = 3
    @rooms = []
    @item = []
    @rooms_data = []
    @rooms_data.push(['cottage', 'You are inside the cottage.  You can leave to the north or south, or the tower is attached to the east.\nThis room has seen better days.  Dusty furniture lies in varying states of decay and disarray.  Large webs drape the corners, and several dead giant spiders are visible.', [3, 2, 1, -1, -1, -1]])
    @rooms_data.push(['Dragon Tower', 'You are inside the dragon\'s tower.  Maybe not the most awesome place to be.  There are steps running along the perimiter of the tower up to the top, some 40 feet above.', [-1, -1, -1, 0, -1, -1]])
    @rooms_data.push(['South of the cottage', 'You are to the south of the cottage.  You can enter to the north or run away.', [0, -1, -1, -1, -1, -1]])
    @rooms_data.push(['North of cottage', 'You are to the north of the cottage.  You can enter to the south or run away', [-1, 0, -1, -1, -1, -1]])
    id = 0
    @rooms_data.each do |room|
      @rooms[id] = Room.new(id, room[0], room[1], room[2])
      id += 1
    end
    # items: [description, start room, takeable, eatable, drinkable, usable, switchable, wearable]
    @items_data = []
    @items_data.push([0, '100gold', 'some shiny bits', true, false, false, false, false, false])
    @items_data.push([1, 'axe', "A dull axe.  Engraved with words: don't be crazy", true, false, false, true, false, false])
    @items_data.push([2, 'piece of thread', 'useful for sewing buttons', true, false, false, true, false, false])
    @items_data.push([2, 'Timbers Jersey', 'The jersey of a great squad. RCTID', true, false, false, false, false, true])
    @items_data.push([3, 'pocket lint', 'Useful for hitchhiking', true, false, false, false, false, true])
    id = 0
    @items_data.each do |item|
      this_room = item[0]
      # puts "Item ID: #{item} - Room: #{this_room}"
      @item[id] = Thing.new(item[1], item[2], item[3], item[4], item[5], item[6], item[7], item[8])
      @rooms[this_room].contains(@item[id])
      id += 1
      # puts 'End end Item add'
    end
  end

  def get_room_name(roomID)
    @rooms_name[roomID]
  end

  def go(room, direction, player)
    destination = room.destination(direction)
    if destination >= 0
      player.room = destination
    else puts "You can't go that way"
    end
  end

  def this_room(room_id)
    @rooms[room_id]
  end
end # World
