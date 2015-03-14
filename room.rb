class Room
  def initialize(id, name, description, contents, exits)
    @id = id
    @name = name
    @description = description
    @contents = contents
    @exits = exits
  end
  def describe
    puts @description
  end
  def name
    return @name
  end
  def contains
    if contents.length > 0 then
      contents.each do |item|
        puts item.name
      end
    else
      puts "The room is empty"
    end
  end
end


