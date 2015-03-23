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
    @round = 0
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
end
