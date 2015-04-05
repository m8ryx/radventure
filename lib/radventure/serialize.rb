class Serialize
  def initialize(game, world, player)
    save_objects = Array.new
    save_objects = [ game, world, player ]
    ap game
    ap save_objects
    return save_objects
  end
end

