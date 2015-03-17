class Sentence
  def initialize(sentence)
    @sentence = sentence
    @objects = sentence.split(' ')
    @verb = @objects.shift
  end
  attr_reader :verb
  attr_reader :objects

  def to_objects(room, player)
    subject = @objects
    these_objects = []
    inventory = player.has
    room_contents = room.contents
    available_stuff = inventory + room_contents
    subject.each do |word|
      available_stuff.each do |stuff|
        if word == stuff.name
          puts 'match'
          these_objects.push(stuff)
        end
      end
    end
    puts "object: #{these_objects[0].name}" if these_objects.length > 0
    these_objects
  end
end
