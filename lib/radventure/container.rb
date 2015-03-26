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
    output = Output.new(@inventory)
    return output.list_to_phrase('nothing')
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
