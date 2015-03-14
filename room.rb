class Room
  def initialize(id, name, description, exits)
    @id = id
    @name = name
    @description = description
    @exits = exits
    @visited = false # has the player been here?
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
    return @contents
  end
  def look
    describe
    showContents
    exits
  end
  def showContents
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
  def exits
    directions = ["north","south","east","west","up","down"]
    shown = false
    print "You can go "
    0.upto(5) do |i|
      if @exits[i] > -1
        print ", " if shown
        print directions[i] 
        shown = true
      end
    end
    if shown
      puts "."
    else
      puts "nowhere."
    end
  end

  def gains(thing)
    @contents.push(thing)
  end
  def loses(thing)
      @contents.delete_if { |content| content == thing }
  end
  def visited
    @visited = true
  end
  def visited?
    return @visited
  end
  def hasItem?(item)
    @contents.each do |thing|
      if item == thing
        return true
      else
        return false
      end
    end
  end
end


