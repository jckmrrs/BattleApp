require 'game'
require 'player'
describe Game do

  let(:subject) { Game.new(player_1, player_2) }
  let(:player_1) { (Player.new("Jack")) }
  let(:player_2) { (Player.new("Josh")) }
  describe '#new' do
    it 'shows the first player' do
      expect(subject.player_one).to eq player_1
    end
    it 'shows the second player' do
      expect(subject.player_two).to eq player_2
    end
    it 'sets it to player ones turn to begin with' do
      expect(subject.show_turn).to eq player_1
    end
    it 'sets the opponent turn to player 2' do
      expect(subject.show_opponent_turn).to eq player_2
    end
  end

  describe '#attack' do
    it 'lowers the hp of the player who is attacked' do
      subject.attack(player_2)
      expect(subject.player_two.hp).to eq 50
    end
  end

  describe '#turn' do
    before(:each) do
      subject.attack(player_2)
    end
    it 'after an attack it switches the turn from player one to player two' do
      expect(subject.show_turn).to equal player_2
    end
    it 'sets the opponent turn to player 1 after one attack' do
      expect(subject.show_opponent_turn).to eq player_1
    end
    it 'after two attach rounds, it is back to player ones turn' do
      subject.attack(player_1)
      expect(subject.show_turn).to equal player_1
    end
  end

end
