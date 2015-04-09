require 'spec_helper'

describe Output do
  before :each do
    @list = Output.new ['this', 'is', 'a', 'test']
    @two = Output.new ['two', 'items']
    @one = Output.new ['one item']
    @empty = Output.new ['nothing here']
  end

  describe '#list_to_phrase' do
    it "takes a list and returns a phrase" do
      expect(@list.list_to_phrase('nothing')).to eq('this, is, a, and test.  ')
    end
    it "takes a list of two items and separates with 'and'" do
      expect(@two.list_to_phrase('nothing')).to eq('two and items.  ')
    end
    it "takes a list of one item and just returns it punctuated" do
      expect(@one.list_to_phrase('nothing')).to eq('one item.  ')
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
