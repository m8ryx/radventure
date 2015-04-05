# Activity matches on verbs and passes objects to the right place.

# Author::    Rick Rezinas  (mailto:rick@beerdrinker.org)
# Copyright:: See attached License
# License::   Distributes under the same terms as Ruby

# This class matches on verbs and passes objects to the right place.

class Activity

  def initialize
  end

  def do_action(verb, objects, room, world, player, game)
    case
      when verb == 'n'
        world.go(room, 'north', player)
      when verb == 's'
        puts 'going south'
        world.go(room, 'south', player)
      when verb == 'e'
        world.go(room, 'east', player)
      when verb == 'w'
        world.go(room, 'west', player)
      when verb == 'u'
        world.go(room, 'up', player)
      when verb == 'd'
        world.go(room, 'down', player)
      when verb == 'quit' || verb == 'q'
        game.stop_playing
      when verb == 'take' || verb == 'get'
        objects.each do |object|
          puts "activity object: #{object.name}"
          player.takes(objects, room)
        end
      when verb == 'drop'
        puts 'verb: dropping'
        player.drops(objects, room)
      when verb == 'inventory' || verb == 'i'
        player.show_inventory
      when verb == 'look' || verb == 'l'
        if objects.length == 0 # no object - describe room
          room.look
        else
          objects.each do |thing| # describe a thing
            puts thing.describe(room, player)
          end
        end
      when verb == 'wear'
        player.wears(objects)
      when verb == 'remove'
        player.removes(objects)
      when verb == 'verbose'
        game.verbose = true
      when verb == 'sparse'
        game.verbose = false
      when verb == 'save'
        game.save('/tmp/radventure.save', game, world, player)
      when verb == 'load'
        array = []
        array = load('/tmp/radventure.save')
        game = (array[0])
        world.initialize(array[1])
        player.initialize(array[2])

    end
  end
end
