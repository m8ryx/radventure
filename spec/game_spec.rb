require 'spec_helper'

describe Game do
  before :each do
    @game = Game.new
  end

  describe '#increment_round' do
    it "increases @round by one" do
      @game.increment_round
      expect(@game.round).to eq(1)
    end
  end
end

#  it 'instantiates a room' do
#    expect(room.class.name).to eq("Room")
#  end
#
#  it 'is called GoldRoom' do
#    expect(room.name).to eq("GoldRoom")
#  end
#end
