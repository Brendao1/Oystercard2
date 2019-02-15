class Journey

attr_reader :entry, :exit

  def initialize(entry)
    @entry = entry
    @exit = nil
  end
  def finish(exit)
    @exit = exit 
  end

end
