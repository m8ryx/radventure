class Thing
  def initialize(name,
                 description,
                 attributes)
    @name = name
    @description = description
    @takeable = attributes['takeable'] || false
    @eatable = attributes['eatable'] || false
    @drinkable = attributes['drinkable'] || false
    @usable = attributes['usable'] || false
    @switchable = attributes['switchable'] || false
    @wearable = attributes['wearable'] || false
  end
  attr_reader :name
  attr_reader :wearable
  alias_method :wearable?, :wearable

  def to_s
    @name
  end

#  def take(room, player)
#    if room.item?(@name)
#      room.remove_item(@name)
#      player.add_item(@name)
#    elsif player.item?(@name)
#      puts 'You already have that!'
#    else
#      puts "You just can't see it anywhere!"
#    end
#  end

  def describe(room, player)
    if room.item?(self) || player.item?(self)
      @description
    else
      return "You don't see that here!"
    end
  end
end
