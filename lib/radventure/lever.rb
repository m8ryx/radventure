class Lever
  def initialize
    @description = "A rusty red lever emerges from the wall."
  end

  def pull
    puts "The earth begins to tremble"
  end

  def to_s
    puts @description
  end
end
