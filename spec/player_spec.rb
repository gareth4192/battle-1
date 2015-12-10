require 'player'

describe Player do
  subject(:player1) { described_class.new('Johnny Cash') }
  subject(:player2) { described_class.new('Bruce Springsteen') }

  before do
    allow(Kernel).to receive(:rand) {10}
  end

  it 'returns player\'s name' do
    expect(player1.name).to eq 'Johnny Cash'
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(player1.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#receive_damage' do
    it 'reduces the player hit points' do
      expect { player2.receive_damage }.to change { player2.hit_points }.by(-10)
    end


  end


end
