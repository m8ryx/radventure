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
    puts exits
  end

  def show_contents
    output = Output.new(contents)
    visible_items = output.list_to_phrase('nothing')
    puts "You see #{visible_items}"
  end

  def contains(thing)
    # puts "Room: #{@name} - adding: #{thing.name}"
    @contents.gets(thing)
  end

  def destination(direction)
    @exits[direction]
  end

  def exits
#    directions = %w(north south east west up down northeast southeast northwest southwest)
    my_exits = Array.new()
    #0.upto(5) do |i|
    #  if @exits[i] > -1
    #    my_exits.push(directions[i])
    #  end
    #end
    @exits.each do |k,v|
      if v != -1
        my_exits.push(k)
      end
    end
    ways_out = Output.new(my_exits)
    exits = "You can go "
    exits += ways_out.list_to_phrase('nowhere')
    return exits
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
