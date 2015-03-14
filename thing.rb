class Thing
  def initialize(name,takeable,points)
    @myName = name
    @takeable = takeable
    @points = points
  end
  def take(room,player)
    if room.hasItem(@myName)
      room.removeItem(@myName)
      player.addItem(@myName)
    elsif player.hasItem(@myName)
      puts "You already have that!"
    else
      puts "You just can't see it anywhere!"
    end
  end
end
