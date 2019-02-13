require_relative 'station'

class Oystercard

attr_reader :balance, :entry_station, :exit_station
attr_accessor :in_journey, :trips

MAX_LIMIT = 90
MIN_LIMIT = 1
FARE = 1.50

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
    @exit_station = nil
    @trips = []
  end

   def top_up(amount)
    fail 'Maximum balance exceeded' if amount + balance > MAX_LIMIT
    @balance += amount
   end

  def deduct(amount)
    @balance = balance - amount
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    fail "Insufficient balance to touch in" if @balance < MIN_LIMIT
    @in_journey = true
    @entry_station = station
  end

  def touch_out(station)
   @exit_station = station
   @balance -= FARE
   store_trips
   @entry_station = nil
   # @trips << {entry_station: @entry_station, exit_station: @exit_station}
   # @in_journey = false
   # @entry_station = nil
  end

  def store_trips
    if @exit_station != nil && @entry_station != nil
      @trips << {entry_station: @entry_station, exit_station: @exit_station}
      @in_journey = false
    end
    @trips
  end

end
