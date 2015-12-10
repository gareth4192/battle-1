require 'game'

describe Game do
  let(:player1) { double(:player1, name: 'Johnny Cash') }
  let(:player2) { double(:player2, name: 'Computer') }
  subject(:game) { described_class.new(player1,player2) }

  before do
    allow(Kernel).to receive(:rand) {10}
    allow(player2).to receive(:receive_damage)
    allow(player1).to receive(:heal)
  end

  describe '#attack' do
    it 'damages the player' do
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

  describe '#heal' do
    it 'heals current player by random amount' do
      expect(player1).to receive(:heal)
      game.heal(player1)
    end
  end

  describe '#feedback_message' do
    it 'returns an attack message after attack' do
      game.attack(player2)
      expect(game.message).to eq "#{player1.name} attacked #{player2.name}"
    end

    it 'returns a healed message after heal' do
      game.heal(player1)
      expect(game.message).to eq "#{player1.name} you are healed"
    end
  end
end
