require_relative "world"
require_relative "game"
require_relative "player.rb"
require_relative "activity.rb"
require_relative "thing.rb"
require_relative "room.rb"
require_relative "sentence.rb"

def getInput
  print "> "
  choice = $stdin.gets.chomp
  return choice
end

player = Player.new()
world = World.new()
game = Game.new()

while game.playing?
  room = player.getRoom
  whereAmI = world.thisRoom(room)

  puts "======================================================="
  puts "== Room: #{whereAmI.name} =========== Score: #{game.getScore} ===== Round: #{game.getRound} ======="
  puts "======================================================="
  if !whereAmI.visited? || game.verbose?
    whereAmI.look
    whereAmI.visited
  end
  action = getInput()
  sentence = Sentence.new(action)
  verb = sentence.verb
  objects = sentence.toObjects(whereAmI,player)

  activity = Activity.new(verb,objects)

  activity.doAction(verb,objects,whereAmI,world,player, game)
  game.incrementRound
end
