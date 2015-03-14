class Room
  def initialize(id, name, description, exits)
    @id = id
    @name = name
    @description = description
    @exits = exits
    # create the things in the room
    @contents = Array.new
#    contents.each
  end
  def describe
    puts @description
  end
  def name
    return @name
  end
  def contents
    if @contents.length > 0 then
      puts "You see..."
      @contents.each do |item|
        puts item.name
      end
    else
      puts "The room is empty"
    end
  end
  def contains(thing)
    puts "Room: #{@name} - adding: #{thing.name}"
    @contents.push(thing)
  end
  def destination(direction)
    return @exits[direction]
  end
end


