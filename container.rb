class Container
  def initialize
    @inventory[]
  end

  def has
    inventory
  end

  def item?(item)
    @inventory.each do |thing|
      if item == thing
        return true
      else
        return false
      end
    end
  end

  def loses(object)
    @inventory.delete_if { |item| item == thing }
  end

  def takes(object)
    @contents.push(thing)
  end
end
