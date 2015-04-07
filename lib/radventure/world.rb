class World
  def initialize
    @start_room = 0
    @rooms = []
    @item = []
    @rooms_data = []
    @world_nouns = []
    @rooms_data.push(['cottage', 'You are inside the cottage.  You can leave to the north or south, or the tower is attached to the east.\nThis room has seen better days.  Dusty furniture lies in varying states of decay and disarray.  Large webs drape the corners, and several dead giant spiders are visible.', { 'north' => 3, 'south' => 2, 'east' => 1 }])
    @rooms_data.push(['Dragon Tower', 'You are inside the dragon\'s tower.  Maybe not the most awesome place to be.  There are steps running along the perimiter of the tower up to the top, some 40 feet above.', { 'west' => 0 }])
    @rooms_data.push(['South of the cottage', 'You are to the south of the cottage.  You can enter to the north or run away.', { 'north' => 0 }])
    @rooms_data.push(['North of cottage', 'You are to the north of the cottage.  You can enter to the south or run away', { 'south' => 0 }])
    id = 0
    @rooms_data.each do |room|
      @rooms[id] = Room.new(id, room[0], room[1], room[2])
#      @world_nouns.push(room[1])
      id += 1
    end
    # items: [start room, identifier, description, {attributes}]
    @items_data = []
    @items_data.push([0, '100gold', 'some shiny bits', {'takeable' => true }])
    @items_data.push([1, 'axe', "A dull axe.  Engraved with words: don't be crazy", {'takeable' => true}])
    @items_data.push([2, 'piece of thread', 'useful for sewing buttons', {'takeable' => true}])
    @items_data.push([2, 'Timbers Jersey', 'The jersey of a great squad. RCTID', {'takeable' => true, 'wearable' => true }])
    @items_data.push([3, 'pocket lint', 'Useful for hitchhiking', {'takeable' => true}])
    id = 0
    @items_data.each do |item|
      this_room = item[0]
      # puts "Item ID: #{item} - Room: #{this_room}"
      @item[id] = Thing.new(item[1], item[2], item[3])
#      @world_nouns.push(@item[id][0])
      @rooms[this_room].contains(item[1])
      id += 1
      # puts 'End end Item add'
    end
  end

  attr_reader :world_nouns

  def get_room_name(roomID)
    @rooms_name[roomID]
  end

  def go(room, direction, player)
    destination = room.destination(direction)
    if destination
      player.room = destination
    else puts "You can't go that way"
    end
  end

  def this_room(room_id)
    @rooms[room_id]
  end
end # World
