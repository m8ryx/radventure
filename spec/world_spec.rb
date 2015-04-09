require 'spec_helper'

describe World do
  before :each do
    @world = World.new
    @player = build(:player)
    @three = build(:room, :id => 3, :name => "Three", :description => "A snappy room.", :directions => { 'north' => 0, 'south' => 1, 'east' => 2, 'west' => 4 } )
    @north = build(:room, :id => 0, :name => "North", :description => "north room!", :directions => { 'south' => 3 })
    @south = build(:room, :id => 1, :name => "South", :description => "south of center", :directions => { 'north' => 3 })
    @east = build(:room, :id => 2, :name => "East", :description => "east of center", :directions => { 'west' => 3 })
    @west = build(:room, :id => 4, :name => "West", :description => "west!", :directions => { 'east' => 3 })
  end

  describe '#go(room, direction, player)' do
    it 'goes to a room' do
      @world.go(@three, 'east', @player)
      expect(@player.room).to eq(2)
    end
    it 'does not go to a room when there is no direction' do
      @world.go(@three, 'up', @player)
      expect(@player.room).to eq(3)
    end
  end



#  describe '#increment_round' do
#    it "increases @round by one" do
#      @world.increment_round
#      expect(@world.round).to eq(1)
#    end
#  end
#end
end

#  it 'instantiates a room' do
#    expect(room.class.name).to eq("Room")
#  end
#
#  it 'is called GoldRoom' do
#    expect(room.name).to eq("GoldRoom")
#  end
#end
