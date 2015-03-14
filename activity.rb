class Activity
  def initialize(verb, objects)
#    @verbs = ['n','s','e','w','u','d','take','get','drop','i','inventory','look','quit']
    
    #return(sentence)
  end
#  def split(sentence)
#    words = sentence.split(' ')
#    return words
#  end
  def doAction(verb,objects,room,myWorld,player)
    case
      when verb == "n"
        myWorld.go(room,0,player)
      when verb == "s"
        puts "going south"
        myWorld.go(room,1,player)
      when verb == "e"
        myWorld.go(room,2,player)
      when verb == "w"
        myWorld.go(room,3,player)
      when verb == "u"
        myWorld.go(room,4,player)
      when verb == "d"
        myWorld.go(room,5,player)
      when verb == "quit" || verb == "q"
        player.stopPlaying
      when verb == "take" || verb == "get"
        player.takes(objects,room)
      when verb == "drop"
        puts "dropping"
        player.drops(objects,room)
      when verb == "inventory" || verb == "i"
        player.inventory
      when verb == "look" || verb == "l"
        if objects.length == 0 # no object - describe room
          room.look
        else
          objects.each do |thing| # describe a thing
            thing.describe(room,player)
          end
        end
      when verb == "verbose"
        player.verbose
      when verb == "sparse"
        player.sparse
    end
  end
end

