require 'game'

describe Game do
  let(:player1) { double(:player1) }
  let(:player2) { double(:player2) }
  subject(:game) { described_class.new(player1,player2) }

  before do
    allow(Kernel).to receive(:rand) {10}
  end 

  describe '#attack' do
    it 'damages the player' do
      allow(player2).to receive(:receive_damage)
      expect(player2).to receive(:receive_damage)
      game.attack(player2)
    end
  end

  describe '#player_1' do
    it 'returns the first player' do
      expect(game.player_1).to eq player1
    end
  end

  describe '#player_1' do
    it 'return the first player' do
      expect(game.player_2).to eq player2
    end
  end

  describe '#current_player' do
    it 'returns current player' do
      expect(game.current_player).to eq player1
    end
  end

  describe '#switch' do
    it 'reassigns current player' do
      expect(game.switch).to eq player2
    end
  end

  describe '#other_player' do
    it 'returns the other player' do
      expect(game.other_player).to eq player2
    end
  end






end
