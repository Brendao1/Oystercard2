# require_relative 'station'

class Oystercard

attr_reader :balance, :entry_station, :exit_station
attr_accessor :in_journey, :trips

MAX_LIMIT = 90
MIN_LIMIT = 1
FARE = 1.50

  def initialize
    @balance = 0
    @in_journey = false  # move to Jouney Class
    @entry_station = nil # Move to journey
    @exit_station = nil  # Move to Journey
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
    @entry_station != nil  # Move to Journey
  end

  def touch_in(station)
    fail "Insufficient balance to touch in" if @balance < MIN_LIMIT
    @in_journey = true  # Journey class
    @entry_station = station # Journey class
  end

  def touch_out(station)
   @exit_station = station # Journey class
   @balance -= FARE
   store_trips  # since entry and exit are in Journey, we need a Journey method to return the info about the journey
   @entry_station = nil  # Journey class

  end

  def store_trips
    if @exit_station != nil && @entry_station != nil
      @trips << {entry_station: @entry_station, exit_station: @exit_station}
      @in_journey = false # Journey class
    end
    @trips
  end

end
