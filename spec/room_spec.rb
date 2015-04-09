require 'spec_helper'

describe Room do
  before :each do
    @goldroom = build(:room)
    @three = build(:room, :id => 3, :name => "Three", :description => "A snappy room.", :directions => { 'north' => 0, 'south' => 1, 'west' => 4 } )
    @north = build(:room, :id => 0, :name => "North", :description => "north room!", :directions => { 'south' => 3 })
    @south = build(:room, :id => 1, :name => "South", :description => "south of center", :directions => { 'north' => 3 })
    @east = build(:room, :id => 2, :name => "East", :description => "east of center", :directions => { 'west' => 3 })
    @west = build(:room, :id => 4, :name => "West", :description => "west!", :directions => { 'east' => 3 })
    @axe = build(:thing, :name => 'axe', :description => 'A hefty axe', :takeable => true) # a simple takeable Thing
    @hammer = build(:thing, :name => 'hammer', :takeable => true) # a simple takeable Thing
    @north.contains(@hammer)
  end

  describe '#new' do
    it "takes id, name, description, exit, and creates a Room object" do
      expect(@goldroom.class).to eq(Room)
    end
  end
  describe '#destination' do
    it "takes a direction and goes that way" do
      expect(@three.destination('west')).to eq(4)
    end
  end
  describe '#exits' do
    it "shows the directions the player can go" do
      expect(@three.exits()).to eq('You can go north, south, and west.  ')
    end
  end
  describe '#add_exit' do
    it 'adds an exit to a room' do
      expect(@three.destination('east')).to eq(nil)
      @three.add_exit('east', 2)
      expect(@three.destination('east')).to eq(2)
    end
  end
  describe '#gains' do
    it 'an item can be added to the room' do
      @three.gains(@axe)
      expect(@three.item?(@axe)).to eq(true)
    end
  end
  describe '#loses' do
    it 'an item can be removed from the room' do
      @north.loses(@hammer)
      expect(@north.item?(@hammer)).to eq(false)
    end
  end
  describe '#item?' do
    it 'reports containing an item if it has it' do
      expect(@north.item?(@hammer)).to eq(true)
    end
    it 'returns false if the item is not present' do
      expect(@north.item?(@axe)).to eq(false)
    end
  end
  describe '#name' do
    it 'returns the name of the room' do
      expect(@goldroom.name).to eq('GoldRoom')
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
