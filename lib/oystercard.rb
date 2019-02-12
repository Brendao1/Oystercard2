class Oystercard

attr_reader :balance
attr_accessor :in_journey

MAX_LIMIT = 90
MIN_LIMIT = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

   def top_up(amount)
    fail 'Maximum balance exceeded' if amount + balance > MAX_LIMIT
    @balance += amount
   end

  def deduct(amount)
    @balance = balance - amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient balance to touch in" if @balance < MIN_LIMIT
    @in_journey = true
  end

  def touch_out
   @in_journey = false
  end

end
