class Player
  def initialize
    @room = 3
    @pocket = Container.new # for inventory
    @body = Container.new   # for clothing
    @living = true
    shirt = Thing.new('shirt', 'A worn-out T-shirt', { 'takeable' => true, 'wearable' => true })
    trousers = Thing.new('trousers', 'a dirty pair of trousers', { 'takeable' => true, 'wearable' => true })
    shoes = Thing.new('Nikes', 'some badass Nikes', { 'takeable' => true, 'wearable' => true })
#    @wearing = [shirt, trousers, shoes]
    @body.gets(shirt)
    @body.gets(trousers)
    @body.gets(shoes)
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
        @pocket.gets(object)
      else
        puts 'That is not available to take'
      end
    end
  end

  def drops(objects, room)
    objects.each do |object|
      if @pocket.has?(object)
          @pocket.loses(object)
          room.gains(object)
      else puts "You aren't holding #{object.name}"
      end
    end
  end

  def show_inventory
    print 'You are carrying...'
    puts @pocket.to_s
    print 'You are wearing...'
    puts @body.to_s
  end

  def wears(items)
    items.each do |item|
      if @pocket.has?(item)
        if item.wearable?
          @body.gets(item)
          @pocket.loses(item)
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
      if @body.has?(item)
        @body.loses(item)
        @pocket.gets(item)
      else puts "You're not wearing that!"
      end
    end
  end

#  def wearing
#    if @wearing.length > 0
#      puts 'You are wearing '
#      @wearing.each do |clothes|
#        puts "#{clothes.name}"
#      end
#    else
#      puts "You're naked as a babe"
#    end
#  end

#  def wearing?(item)
#    @wearing.each do |clothes|
#      return true if item.name == clothes.name
#    end
#    return false
#  end

  def has
    @body.list + @pocket.list
  end

#  def carrying?(item)
#    @inventory.each do |thing|
#      return true if item == thing
#    end
#    return false
#  end

  def item?(item)
    if @pocket.has?(item) || @body.has?(item)
      true
    else
      false
    end
  end
end
