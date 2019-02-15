# require_relative 'station'

class Oystercard

attr_reader :balance
attr_accessor :trips

MAX_LIMIT = 90
MIN_LIMIT = 1
FARE = 1

  def initialize
    @balance = 0
    @trips = []
  end

   def top_up(amount)
    fail 'Maximum balance exceeded' if amount + balance > MAX_LIMIT
    @balance += amount
   end

  def deduct(amount)
    @balance = balance - amount
  end

  def touch_in(station)
    fail "Insufficient balance to touch in" if @balance < MIN_LIMIT
    @journey = Journey.new(station)
  end

  def touch_out(station)
   if @journey == nil
     then @journey = Journey.new()
   end
    @journey.finish(station)
    @balance -= @journey.fare
    store_trips  # since entry and exit are in Journey, we need a Journey method to return the info about the journey
  end

  def store_trips
      @trips << {entry_station: @journey.entry, exit_station: @journey.exit}
  end

end
