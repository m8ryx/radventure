class Room
  def initialize(id, name, description, exits)
    @id = id
    @name = name
    @description = description
    @exits = exits
    @visited = false # has the player been here?
    # create the things in the room
    @contents = []
  end
  attr_reader :name
  attr_reader :contents
  attr_reader :visited
  alias_method :visited?, :visited

  def describe
    puts @description
  end

  def look
    describe
    show_contents
    exits
  end

  def show_contents
    if @contents.length > 0
      puts 'You see...'
      @contents.each do |item|
        puts item.name
      end
    else
      puts 'The room is empty'
    end
  end

  def contains(thing)
    puts "Room: #{@name} - adding: #{thing.name}"
    @contents.push(thing)
  end

  def destination(direction)
    @exits[direction]
  end

  def exits
    directions = %w(north south east west up down)
    shown = false
    print 'You can go '
    0.upto(5) do |i|
      if @exits[i] > -1
        print ', ' if shown
        print directions[i]
        shown = true
      end
    end
    if shown
      puts '.'
    else
      puts 'nowhere.'
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

  def item?(item)
    @contents.each do |thing|
      show_contents
      if item == thing
        return true
      end
    end
    return false
  end
end
