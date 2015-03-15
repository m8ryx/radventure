class Player
  def initialize()
    @room = 3
    @inventory = []
    @living = true
    shirt = Thing.new("shirt", "A worn-out T-shirt",true,false,false,false,false,true)
    trousers = Thing.new("trousers", "a dirty pair of trousers",true,false,false,false,false,true)
    shoes = Thing.new("Nike's", "some badass Nike's",true,false,false,false,false,true)
    @wearing = [shirt,trousers,shoes]
  end
  def getRoom()
    return @room
  end
  def setRoom(newRoom)
    @room = newRoom
  end
  def kill(reason)
    puts reason
    puts "Bummmer!"
    game.stopPlaying(player)
    return true
  end
  def getInventory()
    return @inventory
  end
  def takes(objects,room)
    objects.each do |object|
      if room.hasItem?(object)
        room.loses(object)
        @inventory.push(object)
      else
        puts "That's not available to take"
      end
    end
  end
  def drops(objects,room)
    tmpThings = Array.new
    objects.each do |object|
      @inventory.each do |item|
        if item == object
          tmpThings.push(object)
          @inventory.delete_if { |content| content == object }
          room.gains(object)
        end
      end
    end
  end
  def inventory
    puts "You are carrying..."
    if @inventory.length > 0
      @inventory.each do |item|
        puts item.name
      end
    else
      puts "nothing. nothing at all"
    end
    wearing
  end
  def wear(item)
    if player.has(item)
      if item.wearble?
        @wearing.push(item)
      else
        puts "You can't wear #{item.name}!"
      end
    else
      puts "You need to have that first!"
    end
  end
  def wearing
    if @wearing.length > 0
      puts "You are wearing "
      @wearing.each do |clothes|
        print "#{clothes.name}, "
      end
    else
      print "You're naked as a babe"
    end
  end
  def has
    return @wearing + @inventory
  end
  def hasItem?(item)
    @inventory.each do |thing|
      if item == thing
        return true
      else
        return false
      end
    end
  end
end

