class Player
  def initialize
    @room = 3
    @inventory = []
    @living = true
    shirt = Thing.new('shirt', 'A worn-out T-shirt', true, false, false, false, false, true)
    trousers = Thing.new('trousers', 'a dirty pair of trousers', true, false, false, false, false, true)
    shoes = Thing.new('Nikes', 'some badass Nikes', true, false, false, false, false, true)
    @wearing = [shirt, trousers, shoes]
  end
  attr_accessor :room, :inventory

  def kill(reason)
    puts reason
    puts 'Bummmer!'
    game.stop_playing(player)
    true
  end

  def takes(objects, room)
    objects.each do |object|
      if room.item?(object)
        room.loses(object)
        @inventory.push(object)
      else
        puts 'That is not available to take'
      end
    end
  end

  def drops(objects, room)
    tmp_things = []
    objects.each do |object|
      @inventory.each do |item|
        if item == object
          tmp_things.push(object)
          @inventory.delete_if { |content| content == object }
          room.gains(object)
        end
      end
    end
  end

  def show_inventory
    puts 'You are carrying...'
    if @inventory.length > 0
      @inventory.each do |item|
        puts item.name
      end
    else
      puts 'nothing. nothing at all'
    end
    wearing
  end

  def wears(items)
    items.each do |item|
      if carrying?(item)
        if item.wearable?
          @wearing.push(item)
          @inventory.delete_if { |clothes| clothes.name == item.name }
        else
          puts "You can't wear #{item.name}!"
        end
      else
        puts 'You need to have that first!'
      end
    end
  end

  def removes(items)
    items.each do |item|
      if wearing?(item)
        @wearing.delete_if { |clothes| clothes.name == item.name }
        @inventory.push(item)
      end
    end
  end

  def wearing
    if @wearing.length > 0
      puts 'You are wearing '
      @wearing.each do |clothes|
        puts "#{clothes.name}"
      end
    else
      puts "You're naked as a babe"
    end
  end

  def wearing?(item)
    @wearing.each do |clothes|
      return true if item.name == clothes.name
    end
    return false
  end

  def has
    @wearing + @inventory
  end

  def carrying?(item)
    @inventory.each do |thing|
      return true if item == thing
    end
    return false
  end

  def item?(item)
    @inventory.each do |thing|
      if item == thing
        true
      else
        false
      end
    end
  end
end

