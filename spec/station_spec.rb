require 'station'

describe Station do

  describe "zone" do
    it "should return the zone of the station" do
      station = Station.new("Highbury", 2)
      expect(station.zone).to eq (2)
    end
  end

  describe "name" do
    it "should return the name of the station" do
      station = Station.new("Highbury", 2)
      expect(station.name).to eq ("Highbury")
    end
  end

end
