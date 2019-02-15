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

  def complete?
    return true if (!@entry.nil? && !@exit.nil?)
    false
  end

  def fare
    complete? ? FARE : PENALTY
  end


end
