class Activity
  def initialize(sentence)
    @verbs = ['n','s','e','w','u','d','take','get','drop','i','inventory','look','quit']
    return(sentence)
  end
  def split(sentence)
    words = sentence.split(' ')
    return words
  end
  def findVerb(thisVerb)
    myVerb = ""
    # this just validates that it's actually a verb!!
    @verbs.each do |verb|
      myVerb = thisVerb if verb == thisVerb
    end
    if myVerb == ""
      puts "That's not a verb I recognize"
      return 0
    else
      return thisVerb
    end
  end
  def findObject(sentence, stuffHere)
    thisStuff = []
    words = split(sentence)
    words.each do |word|
      stuffHere.each do |stuff|
        thisStuff.push(stuff) if word == stuff
      end
    end
    # this is probably not true
    if thisStuff.length > 1
      puts "Only one object please"
      return 0
    end
  end
  def doAction(verb,objects,myRoom,myStuff,roomStuff,myWorld,me)
    case
      when verb == "n"
        myWorld.go(myRoom,0,me)
      when verb == "s"
        puts "going south"
        myWorld.go(myRoom,1,me)
      when verb == "e"
        myWorld.go(myRoom,2,me)
      when verb == "w"
        myWorld.go(myRoom,3,me)
      when verb == "u"
        myWorld.go(myRoom,4,me)
      when verb == "d"
        myWorld.go(myRoom,5,me)
      when verb == "quit"
        me.stopPlaying(me)
      when verb == "take" || verb == "get"
        myWorld.take(myRoom,objects,myWorld,me,myStuff)
    end
  end
end

