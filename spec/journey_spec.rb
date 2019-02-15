require 'journey'

describe 'Journey' do

it 'has an entry station on creation' do
  station_double = double("Vic")
  journey = Journey.new(station_double)
  expect(journey.entry).to eq station_double
end

# testing

end
