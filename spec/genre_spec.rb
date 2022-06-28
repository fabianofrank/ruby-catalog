require_relative '../genre'
require_relative '../music'

genre = Genre.new('Funk')

music = Music.new('Anitta', 'Youtube', 'Poderosas', '2005-01-30')

describe Genre do
  context 'When instantiating the Genre class' do
    it 'should initiate with a (name) parameter and be able to access it.' do
      expect(genre.name).to eq 'Funk'
    end

    it 'should be able add_item(music) to the genre instace @items = []' do
      genre.add_item(music)
      expect(genre.items.length).to eq 1
    end
  end
end
