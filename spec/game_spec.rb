require_relative '../lib/game'

RSpec.describe Game do
  let(:game) { Game.new('2000-01-01', '2020-01-01', true, 'warcraft') }
  context '#initialize' do
    it 'should initialize with a publish date' do
      expect(game.last_played_at).to eq('2020-01-01')
    end
    it 'should check if is multiplayer or not' do
      expect(game.multiplayer).to eq(true)
    end
    it 'should initialize with a label' do
      expect(game.label).to eq('warcraft')
    end
  end

  context '#can_be_archived?' do
    it 'should return true if parent\'s method returns true AND if last_played_at is older than 2 years' do
      expect(game.can_be_archived?).to eq(true)
    end
  end
end
