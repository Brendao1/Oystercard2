  require 'station'
  describe Station do

    # let(:exit_station){ double :station }

  before(:each) do
      @station = Station.new("Holborn", 1)
     end

  it 'is created with a name' do
    expect(@station.name).to eq "Holborn"
  end


  it 'is created with a zone' do
    expect(@station.zone).to eq 1
  end


  end
