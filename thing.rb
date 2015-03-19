class Thing
  def initialize(name,
                 description,
                 takeable,
                 eatable,
                 drinkable,
                 usable,
                 switchable,
                 wearable)
    @name = name
    @description = description
    @takeable = takeable
    @eatable = eatable
    @drinkable = drinkable
    @usable = usable
    @switchable = switchable
    @wearable = wearable
  end
  attr_reader :name
  attr_reader :wearable
  alias_method :wearable?, :wearable

  def take(room, player)
    if room.item?(@name)
      room.remove_item(@name)
      player.add_item(@name)
    elsif player.item?(@name)
      puts 'You already have that!'
    else
      puts "You just can't see it anywhere!"
    end
  end

  def describe(room, player)
    if room.item?(@name) || player.item?(@name)
      puts @description
    else
      puts "You don't see that here!"
    end
  end
end
