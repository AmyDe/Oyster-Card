class Oystercard

  attr_reader :balance, :entry_station

  DEFAULT_LIMIT = 90
  LOWER_LIMIT = 1
  MIN_FARE = 1
  EMPTY_CARD = 0

  def initialize(balance = EMPTY_CARD)
    @balance = balance
  end

  def top_up(value)
    raise "Top up not possible, limit of #{DEFAULT_LIMIT} reached." if limit_reached?(value)
    @balance += value
  end

  def limit_reached?(value)
    @balance + value > DEFAULT_LIMIT
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station)
    raise "Sorry, you do not have enough money." if @balance < LOWER_LIMIT
    @entry_station = entry_station
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
  end

  private

  def deduct(value)
    @balance -= value
  end

end
