require 'journey'

describe 'Journey' do

  let(:entry_double) {double "Vic"}
  let(:exit_double) {double "Camden"}

  before :each do
    @journey = Journey.new(entry_double)
  end
it 'has an entry station on creation' do
  expect(@journey.entry).to eq entry_double
end

it 'exit station is nil when created' do
  expect(@journey.exit).to eq nil
end

it 'sets exit station when tapping out' do
  @journey.finish(exit_double) # this sets the attribute
  expect(@journey.exit).to eq exit_double  # this checks the attribute
end

it "is in a journey on creation" do

end
end
