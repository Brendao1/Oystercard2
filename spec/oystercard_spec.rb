require 'oystercard'
describe Oystercard do

PENALTY = 6

    let(:exit_station){ double :station }
    let(:entry_station){ double :station }

  it 'has a balance of zero' do
  expect(subject.balance).to eq(0)
  end


  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
    expect { subject.top_up 2 }.to change{ subject.balance }.by 2

  end

  it 'raises an error if the maximum balance is exceeded' do
   maximum_balance = Oystercard::MAX_LIMIT
   subject.top_up(maximum_balance)
   expect{ subject.top_up 1 }.to raise_error 'Maximum balance exceeded'

 end

end

  describe '#deduct' do

  it 'deducts amount from balance' do
    o = Oystercard.new
    o.top_up(20)
    amount = 10
    expect {subject.deduct(amount)}. to change {subject.balance }.by -amount
  end
end

  describe '#touch_in' do

    it 'will not touch in if below minimum balance' do
      expect{ subject.touch_in(entry_station) }.to raise_error "Insufficient balance to touch in"
    end
  end

  describe '#touch_out' do

    it 'touches out and deducts the fare from the balance' do
    o = Oystercard.new
    o.top_up(90)
    o.touch_in(entry_station)
    expect { o.touch_out(exit_station) }.to change { o.balance }.by (-Oystercard::FARE)
    end

    it 'touches out and deducts the penalty fare from the balance' do
    o = Oystercard.new
    o.top_up(90)
    expect { o.touch_out(exit_station) }.to change { o.balance }.by (-PENALTY)
    end

    it 'checks that the default list of trips is empty' do
      o = Oystercard.new
      o.top_up(20)
      expect(o.trips).to be_empty
    end

    let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

    it 'stores a journey' do
      o = Oystercard.new
      o.top_up(20)
      o.touch_in(entry_station)
      o.touch_out(exit_station)
      expect(o.trips).to include journey
    end

  end

end
