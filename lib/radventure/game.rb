class Game

  attr_reader :round
  attr_reader :score
  attr_reader :playing
  attr_accessor :verbose
  alias_method :verbose?, :verbose
  alias_method :playing?, :playing

  def initialize

    @round = 0
    @score = 0
    @verbose = false
    @playing = true
  end

  def show_game_stats
    puts "Great jorb!  You've accumulated #{score} points over #{round} rounds."
  end

  def increment_round
    @round += 1
  end

  def stop_playing
    @playing = false
    show_game_stats
  end

  def rebuild(round, score, verbose, playing)
    @round = round
    @score = score
    @verbose = verbose
    @playing = playing
  end

  def save(file, game, world, player)
    save_objects = Serialize.new(game, world, player)
    puts "---------- Save Objects ---------"
    ap save_objects
#    serialized = YAML::dump([ game, world, player ])
#    puts YAML::dump(serialized)
#    ap serialized
    savefile = File.open( file, 'w' )
    [game, world, player].each do |object|
      savefile.puts YAML::dump(object)
      savefile.puts ""
    end
  end

  def load(file)
    array = []
    $/ = "\n\n" # separate on two newlines
    File.open( file, 'r' ).each do |object|
      array << YAML::load([ object ])
    end
    return game, world, player
  end
end
