require_relative '../lib/game'

RSpec.describe Game do
    let(:game) { Game.new('Action', 'Nintendo', 'Nintendo', '2020-01-01', true) }

    context '#initialize' do
        it 'should initialize with a genre' do
            expect(game.genre).to eq('Action')
        end
        it 'should initialize with a source' do
            expect(game.source).to eq('Nintendo')
        end
        it 'should initialize with a label' do
            expect(game.label).to eq('Nintendo')
        end
        it 'should initialize with a publish date' do
            expect(game.publish_date).to eq(Time.new(2020, 1, 1))
        end
        it 'should check if is multiplayer or not' do
            expect(game.multiplayer).to eq(true)
        end
    end

    context '#can_be_archived?' do
        it 'should return true if parent\'s method returns true AND if last_played_at is older than 2 years' do
            expect(game.can_be_archived?).to eq(false)
        end
    end
end
