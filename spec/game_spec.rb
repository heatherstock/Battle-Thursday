require 'game'

describe Game do
  let(:player_1) { double('player 1') }
  let(:player_2) { double('player 2') }
  subject(:game) { described_class.new(player_1, player_2) }

  describe "#initialize" do
    it "takes player 1 as argument" do
      expect(game.player_1).to eq player_1
    end
    it "takes player 2 argument" do
      expect(game.player_2).to eq player_2
    end
  end

  describe "#attack" do
    it "tells a player to recieve damage" do
      expect(player_2).to receive(:take_damage)
      game.attack(player_2)
    end

    it "switches to the other players turn" do
      allow(player_2).to receive(:take_damage)
      game.attack(player_2)
      expect(game.turn).to eq player_2
    end
  end
end
