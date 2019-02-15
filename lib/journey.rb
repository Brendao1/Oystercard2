class Journey

FARE = 1
PENALTY = 6

attr_reader :entry, :exit

  def initialize(entry)
    @entry = entry
    @exit = nil
  end

  def finish(exit)
    @exit = exit
  end

  def in_journey?
    @exit.nil?
  end

  def fare
    in_journey? ? PENALTY : FARE
  end


end
