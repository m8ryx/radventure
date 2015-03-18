require_relative 'world'
require_relative 'game'
require_relative 'player.rb'
require_relative 'activity.rb'
require_relative 'thing.rb'
require_relative 'room.rb'
require_relative 'sentence.rb'

def get_input
  print '> '
  choice = $stdin.gets.chomp
  choice
end

player = Player.new
world = World.new
game = Game.new

while game.playing?
  room = player.room
  where_am_i = world.this_room(room)

  puts '======================================================='
  puts "== Room: #{where_am_i.name} =========== Score: #{game.score} ===== Round: #{game.round} ======="
  puts '======================================================='
  if !where_am_i.visited? || game.verbose?
    where_am_i.look
    where_am_i.visited = true
  end
  action = get_input
  sentence = Sentence.new(action)
  verb = sentence.verb
  prepositional_phrase = sentence.get_prepositional_phrase(where_am_i, player)
  objects = sentence.to_objects(where_am_i, player)

  activity = Activity.new

  activity.do_action(verb, objects, where_am_i, world, player, game)
  game.increment_round
end
