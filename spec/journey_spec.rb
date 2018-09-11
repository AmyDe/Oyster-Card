require 'journey'

describe Journey do

  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }

  before(:each) {
    @oyster = Oystercard.new(Oystercard::LOWER_LIMIT)
  }

  # describe '#journeys' do
  #   it 'returns a record of our journeys' do
  #     @oyster.touch_in(entry_station)
  #     @oyster.touch_out(exit_station)
  #     expect(@oyster.journeys).to include({ start: entry_station, end: exit_station })
  #   end
  # end

  # describe '#start' do
  #   it '...' do
  #     subject.start("entry_station")
  #     expect(journey.journey_hash).to eq({ start: "entry_station" })
  #   end
  # end

end
