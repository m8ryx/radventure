class Sentence
  def initialize(sentence)
    @sentence = sentence
    @objects = sentence.split(' ')
    @verb = @objects.shift
  end
  def verb
    return @verb
  end
  def objects
    return @objects
  end
  def toObjects(room,player)
    subject = @objects
    theseObjects = Array.new
    inventory = player.has
    roomContents = room.contents
    availableStuff = inventory + roomContents
    subject.each do |word|
      availableStuff.each do |stuff|
        if word == stuff.name
          puts "match"
          theseObjects.push(stuff)
        end
      end
    end
    puts "object: #{theseObjects[0].name}" if theseObjects.length > 0
    return theseObjects
  end
end
