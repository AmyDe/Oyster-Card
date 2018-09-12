require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey_history

  DEFAULT_LIMIT = 90
  LOWER_LIMIT = 1
  EMPTY_CARD = 0

  def initialize(balance = EMPTY_CARD)
    @balance = balance
    @journey_history = []
    @current_journey = Journey.new
  end

  def top_up(value)
    raise "Top up not possible, limit of #{DEFAULT_LIMIT} reached." if limit_reached?(value)
    @balance += value
  end

  def limit_reached?(value)
    @balance + value > DEFAULT_LIMIT
  end

  def in_journey?
    !@current_journey.journey_hash.empty?
  end

  def touch_in(entry_station)
    raise "Sorry, you do not have enough money." if @balance < LOWER_LIMIT
    if in_journey? then no_touch_out end
    @current_journey.start(entry_station)
  end

  def no_touch_out
    deduct(@current_journey.penalty)
    @current_journey.end('No station')
    store_journey
  end

  def touch_out(exit_station)
    in_journey? ? deduct(@current_journey.fare) : no_touch_in
    @current_journey.end(exit_station)
    store_journey
  end

  def no_touch_in
    deduct(@current_journey.penalty)
    @current_journey.start('No Station')
  end

  def store_journey
    @journey_history.push(@current_journey.journey_hash)
    @current_journey.journey_hash = {}
  end

  private

  def deduct(value)
      @balance -= value
  end

end
