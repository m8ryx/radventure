require_relative "world"
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

while player.playing?
  room = player.getRoom
  whereAmI = world.thisRoom(room)

  puts "=========== Score: #{player.getScore} ====== Room: #{room} - #{whereAmI.name} ===== Round: #{player.getRound} ======="
  if !whereAmI.visited? || player.verbose?
    whereAmI.look
  end
  action = getInput()
  sentence = Sentence.new(action)
  verb = sentence.verb
  objects = sentence.toObjects(whereAmI,player)

  activity = Activity.new(verb,objects)

  activity.doAction(verb,objects,whereAmI,world,player)
  player.incrementRound
end
