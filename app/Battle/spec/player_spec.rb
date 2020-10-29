require 'player'

describe Player do

  describe '#new' do
    let(:subject) { (Player.new("Jack")) }
    it 'makes a new instance of player with the given name' do
      expect(subject.name).to eq "Jack"
    end
    it 'makes a new instance of player with deafault HP' do
      expect(subject.hp).to eq 60
    end
  end

end
