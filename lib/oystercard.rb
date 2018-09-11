class Oystercard

  attr_reader :balance, :entry_station, :journeys

  DEFAULT_LIMIT = 90
  LOWER_LIMIT = 1
  MIN_FARE = 1
  EMPTY_CARD = 0

  def initialize(balance = EMPTY_CARD)
    @balance = balance
    @journeys = []
    @journey_hash = {}
  end

  def top_up(value)
    raise "Top up not possible, limit of #{DEFAULT_LIMIT} reached." if limit_reached?(value)
    @balance += value
  end

  def limit_reached?(value)
    @balance + value > DEFAULT_LIMIT
  end

  def in_journey?
    !@journey_hash.empty?
  end

  def touch_in(entry_station)
    raise "Sorry, you do not have enough money." if @balance < LOWER_LIMIT
    start_journey(entry_station)
  end

  def touch_out(exit_station)
    deduct(MIN_FARE)
    end_journey(exit_station)
  end

  def start_journey(entry_station)
    @journey_hash = { start: entry_station }
  end

  def end_journey(exit_station)
    @journey_hash[:end] = exit_station
    @journeys.push(@journey_hash)
    @journey_hash = {}
  end

  private

  def deduct(value)
    @balance -= value
  end

end
