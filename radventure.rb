require_relative "world"
require_relative "player.rb"
require_relative "activity.rb"
require_relative "thing.rb"
require_relative "room.rb"

def getInput
  print "> "
  choice = $stdin.gets.chomp
  return choice
end

player = Player.new()
world = World.new()

while player.playing?
  myRoom = player.getRoom
  whereAmI = world.thisRoom(myRoom)

  puts "=========== Score: #{player.getScore} ====== Room: #{myRoom} - #{whereAmI.name} ===== Round: #{player.getRound} ======="
#  world.showRoom(myRoom)
  whereAmI.describe
  action = getInput()

  activity = Activity.new(action)
  sentence = activity.split(action)
  myInventory = player.getInventory()
  verb = activity.findVerb(sentence.shift())
  objects = activity.findObject(action,world.getStuff(myRoom))
  roomStuff = world.getStuff(myRoom)

  activity.doAction(verb,objects,myRoom,myInventory,roomStuff,world,player)
  puts verb
  #puts object
#  player.addScore(1,player)
  player.incrementRound
end
