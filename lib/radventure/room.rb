class Room
  def initialize(id, name, description, exits)
    @id = id
    @name = name
    @description = description
    @exits = exits
    @visited = false # has the player been here?
    @contents = Container.new
  end
  attr_reader :name
  attr_accessor :visited
  alias_method :visited?, :visited

  def describe
    puts @description
  end

  def contents
    @contents.list
  end

  def look
    describe
    show_contents
    exits
  end

  def show_contents
    print "You see..."
    @contents.to_s
  end

  def contains(thing)
    # puts "Room: #{@name} - adding: #{thing.name}"
    @contents.gets(thing)
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
    @contents.gets(thing)
  end

  def loses(thing)
    @contents.loses(thing)
  end

  def item?(item)
    @contents.has?(item)
  end
end
