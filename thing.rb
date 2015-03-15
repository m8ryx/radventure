class Thing
#  [name , description, start room, takeable, eatable, drinkable, usable, switchable, wearable
  def initialize(name, description,takeable,eatable,drinkable, usable, switchable, wearable)
    @name = name
#    @points = points
    @description = description
    @takeable = takeable
    @eatable = eatable
    @drinkable = drinkable
    @usable = usable
    @switchable = switchable
    @wearable = wearable
  end
  def take(room,player)
    if room.hasItem(@name)
      room.removeItem(@name)
      player.addItem(@name)
    elsif player.hasItem(@name)
      puts "You already have that!"
    else
      puts "You just can't see it anywhere!"
    end
  end
  def name
    return @name
  end
  def wearable?
    return @wearable
  end
  def describe(room,player)
    if room.hasItem?(@name) || player.hasItem?(@name)
      puts @description
    else
      puts "You don't see that here!"
    end
  end
end
