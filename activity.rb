# Activity matches on verbs and passes objects to the right place.

# Author::    Rick Rezinas  (mailto:rick@beerdrinker.org)
# Copyright:: See attached License
# License::   Distributes under the same terms as Ruby

# This class matches on verbs and passes objects to the right place.

class Activity

  def initialize
  end

  def do_action(verb, objects, room, my_world, player, game)
    case
      when verb == 'n'
        my_world.go(room, 0, player)
      when verb == 's'
        puts 'going south'
        my_world.go(room, 1, player)
      when verb == 'e'
        my_world.go(room, 2, player)
      when verb == 'w'
        my_world.go(room, 3, player)
      when verb == 'u'
        my_world.go(room, 4, player)
      when verb == 'd'
        my_world.go(room, 5, player)
      when verb == 'quit' || verb == 'q'
        game.stop_playing
      when verb == 'take' || verb == 'get'
        objects.each do |object|
          puts "activity object: #{object.name}"
          player.takes(objects, room)
        end
      when verb == 'drop'
        puts 'dropping'
        player.drops(objects, room)
      when verb == 'inventory' || verb == 'i'
        player.show_inventory
      when verb == 'look' || verb == 'l'
        if objects.length == 0 # no object - describe room
          room.look
        else
          objects.each do |thing| # describe a thing
            thing.describe(room, player)
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
    end
  end
end
