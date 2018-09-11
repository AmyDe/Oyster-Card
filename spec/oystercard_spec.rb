require 'oystercard'

describe Oystercard do
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }

  before(:each) {
    @oyster = Oystercard.new(Oystercard::LOWER_LIMIT)
  }

  describe '#balance' do
    it 'should have a default balance of 0' do
      expect(subject.balance).to eq (0)
    end
  end

  describe '#top_up' do
    it 'should add 2 to the balance if top_up is 2' do
      expect{ subject.top_up(2) }.to change { subject.balance }.by 2
    end
    it 'should throw error if goes beyond limit of default' do
      expect { subject.top_up(Oystercard::DEFAULT_LIMIT + 1) }.to raise_error "Top up not possible, limit of #{Oystercard::DEFAULT_LIMIT} reached."
    end
  end

  describe '#in_journey?' do
    it { expect(subject).to_not be_in_journey }
  end

  describe '#touch_in' do
    it "should make in_journey return true" do
      @oyster.touch_in(entry_station)
      expect(@oyster).to be_in_journey
    end
    it 'should raise error when balance below LOWER_LIMIT' do
      expect { subject.touch_in(entry_station) }.to raise_error 'Sorry, you do not have enough money.'
    end
  end

  describe '#touch_out' do
    it "should make in_journey return false" do
      @oyster.touch_in(entry_station)
      @oyster.touch_out(exit_station)
      expect(@oyster).to_not be_in_journey
    end
    it 'should deduct minimum fare from balance' do
      @oyster.touch_in((entry_station))
      expect{ @oyster.touch_out(exit_station) }.to change{ @oyster.balance }.by (-Oystercard::MIN_FARE)
    end
  end

  describe '#journeys' do
    it 'returns an empty list of journeys by default' do
      expect(@oyster.journeys).to be_empty
    end
    it 'returns a record of our journeys' do
      @oyster.touch_in(entry_station)
      @oyster.touch_out(exit_station)
      expect(@oyster.journeys).to include({ start: entry_station, end: exit_station })
    end
  end
end
