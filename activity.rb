class Activity
  def initialize(verb, objects)
#    @verbs = ['n','s','e','w','u','d','take','get','drop','i','inventory','look','quit']
    
    #return(sentence)
  end
  def split(sentence)
    words = sentence.split(' ')
    return words
  end
#  def findVerb(thisVerb)
#    myVerb = ""
#    # this just validates that it's actually a verb!!
#    @verbs.each do |verb|
#      myVerb = thisVerb if verb == thisVerb
#    end
#    if myVerb == ""
#      puts "That's not a verb I recognize"
#      return 0
#    else
#      return thisVerb
#    end
#  end
#  def findObject(sentence, stuffHere)
#    thisStuff = []
#    words = split(sentence)
#    words.each do |word|
#      stuffHere.each do |stuff|
#        thisStuff.push(stuff) if word == stuff
#      end
#    end
#    # this is probably not true
#    if thisStuff.length > 1
#      puts "Only one object please"
#      return 0
#    end
#  end
  def doAction(verb,objects,room,myStuff,roomStuff,myWorld,player)
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
      when verb == "quit"
        player.stopPlaying
      when verb == "take" || verb == "get"
        player.takes(objects,room)
      when
        verb == "drop"
        me.drops(objects,room)
      when verb = "inventory" || verb == "i"
        player.inventory
    end
  end
end

