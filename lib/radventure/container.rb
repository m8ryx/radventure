class Container

  def initialize
    @inventory = Array.new
  end

  def list
    @inventory
  end

#  def push(item)
#    @inventory = [@inventory, item]
#  end

  def to_s
    number_of_things = @inventory.length - 1
    @inventory.each_with_index do |thing, i|
      print "#{thing.name}"
      if i == number_of_things - 1
        print ", and "
      elsif i == number_of_things
        puts ".  "
      else print ", "
      end
    end
    print "\n"
  end

  def has?(item)
    @inventory.each do |thing|
      if item == thing
        return true
      end
    end
    return false
  end

  def loses(item)
    @inventory.delete_if { |thing| item == thing }
  end

  def gets(item)
    @inventory.push(item)
  end
end
