class Journey

  MIN_FARE = 1
  PENALTY = 6

  attr_accessor :journey_hash

  def initialize
    @journey_hash = {}
  end

  def start(entry_station)
    @journey_hash = { start: entry_station }
  end

  def end(exit_station)
    @journey_hash[:end] = exit_station
  end

  def fare
    MIN_FARE
  end

  def penalty
    PENALTY
  end

end
