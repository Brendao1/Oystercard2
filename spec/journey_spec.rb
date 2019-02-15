require 'journey'

describe 'Journey' do

it 'has an entry station on creation' do
  station_double = double("Vic")
  journey = Journey.new(station_double)
  expect(journey.entry).to eq station_double
end

it 'exit station is nil when created' do
  station_double = double("Camden")
  journey = Journey.new(station_double)
  expect(journey.exit).to eq nil
end

it 'sets exit station when tapping out' do
  entry_double = double("Vic")
  journey = Journey.new(entry_double)
  exit_double = double("Camden")
  journey.finish(exit_double) # this sets the attribute
  expect(journey.exit).to eq exit_double  # this checks the attribute
end

end
