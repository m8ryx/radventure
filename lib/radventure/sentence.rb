class Sentence
  def initialize(sentence)
    @sentence = sentence
    @objects = sentence.split(' ')
    @verb = @objects.shift
    remove_articles
  end
  attr_reader :verb
  attr_reader :objects

  def remove_articles
    articles = %w(the a an)
    articles.each do |article|
      @objects.delete_if { |word| word == article }
    end
    puts @objects
  end

  def get_prepositional_phrase(room, player)
    indirect_object = 0
    prepositions = %w(with on under inside into)
    @objects.each_with_index do |word, index|
    prepositions.each do |preposition|
        if word == preposition
          puts "Prepostion: #{word}"
          indirect_object = index + 1
        end
      end
    end
    # assumiing that the word(s) immediately after the preposition are the indirect object
    inventory = player.has
    room_contents = room.contents
    available_stuff = inventory + room_contents
    available_stuff.each do |stuff|
      if @objects[indirect_object] == stuff.name
         return stuff
      end
    end
  end

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
