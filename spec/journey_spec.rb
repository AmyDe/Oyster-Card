require 'journey.rb'

describe Journey do

  let(:entry_station) { double(:Bank) }
  let(:exit_station) { double(:Acton) }

  describe '#start' do
    it 'pushes given entry station to journey hash' do
      subject.start(entry_station)
      expect(subject.journey_hash).to eq({ start: entry_station })
    end
  end

  describe '#end' do
    it "should push exit station to journey hash" do
      subject.start(entry_station)
      subject.end(exit_station)
      expect(subject.journey_hash).to eq({ start: entry_station, end: exit_station })
    end
  end

  describe '#fare' do
    it "calculates the fare for a journey" do
      expect(subject.fare).to eq Journey::MIN_FARE
    end
  end

  describe '#penalty' do
    it "calculates the penalty for incomplete journey" do
      expect(subject.penalty).to eq Journey::PENALTY
    end
  end
end
