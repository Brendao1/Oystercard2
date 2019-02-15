class Journey

FARE = 1

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

end
