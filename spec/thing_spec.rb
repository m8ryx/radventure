require 'spec_helper'

describe Thing do
  before :each do
    @axe = build(:thing, :name => 'axe', :description => 'A hefty axe', :takeable => true)
    @hammer = build(:thing, :name => 'hammer', :description => 'A snappy hammer', :takeable => true)
    @player = Player.new
    @room = build(:room, :id => 3, :name => 'room', :description => 'a room', :directions => {'west' => 1} )
    @room.contains(@axe)
  end

  describe '#new' do
    it 'takes name, description, attributes hash, and creates a Thing object' do
      expect(@axe.class).to eq(Thing)
    end
    it "it has a name" do
      expect(@axe.name).to eq('axe')
    end
    it "is not wearable" do
      expect(@axe.wearable).to eq(false)
    end
  end

  describe '#to_s' do
    it 'outputs the name of the thing' do
      expect(@axe.to_s).to eq('axe')
    end
  end

  describe '#describe' do
    it 'does not describe the hammer if it is not present' do
      expect(@hammer.describe(@room, @player)).to eq("You don't see that here!")
    end
    it 'describes the axe if it is present.  aka. look at' do
      expect(@axe.describe(@room,@player)).to eq('A hefty axe')
    end
  end
end

