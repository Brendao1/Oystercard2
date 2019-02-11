class Oystercard

attr_reader :balance

MAX_LIMIT = 90

  def initialize
    @balance = 0
  end

   def top_up(amount)
    fail 'Maximum balance exceeded' if amount + balance > MAX_LIMIT
    @balance += amount
   end

  def deduct(amount)
    @balance = balance - amount
  end


end
