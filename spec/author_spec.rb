require_relative '../lib/author'
require_relative '../lib/item'
require_relative '../lib/game'

## testing for author's methods
RSpec.describe Author do
  let(:author) { Author.new('John', 'Doe') }
  let(:game) { Game.new('Action', 'Nintendo', 'Nintendo', '2022-01-01', true) }

  context '#initialize' do
    it 'should initialize with a first name' do
      expect(author.first_name).to eq('John')
    end
    it 'should initialize with a last name' do
      expect(author.last_name).to eq('Doe')
    end
    it 'should initialize with an id' do
      expect(author.id).to be_a(Integer)
    end
    it 'should initialize with an empty array of items' do
      expect(author.items).to eq([])
    end
  end

  context '#add_item' do
    it 'should add an item to the author' do
      author.add_item(game)
      expect(author.items.length).to eq 1
    end
  end
end
