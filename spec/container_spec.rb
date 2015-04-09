require 'spec_helper'

describe Container do
  before :each do
    @pocket = Container.new
    @wallet = build(:thing, :name => 'wallet', :description => 'a fancy leather wallet.', :takeable => true)
    @keys = build(:thing, :name => 'keys', :description => 'something I can never find.', :takeable => true)
    @phone = build(:thing, :name => 'phone', :description => 'goes beep.  shiny.', :takeable => true)
    @pocket.gets(@wallet)
    @pocket.gets(@keys)
  end

  describe '#list' do
    it "Returns the list of contents" do
      expect(@pocket.list).to eq([@wallet, @keys])
    end
  end

  describe '#to_s' do
    it "Returns a formatted inventory" do
      expect(@pocket.to_s).to eq('wallet and keys.  ')
    end
  end

  describe '#has?' do
    it "Returns true if item is present" do
      expect(@pocket.has?(@wallet)).to eq(true)
    end
    it "Returns false if the item is not present" do
      expect(@pocket.has?(@phone)).to eq(false)
    end
  end
  describe '#loses' do
    it 'no longer has an item after losing it' do
      @pocket.loses(@keys)
      expect(@pocket.has?(@keys)).to eq(false)
    end
  end
  describe '#gets' do
    it 'now has an item after getting it' do
      @pocket.gets(@phone)
      expect(@pocket.has?(@phone)).to eq(true)
    end
  end
end
