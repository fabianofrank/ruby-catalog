require_relative '../lib/genre'
require_relative '../lib/music'

genre = Genre.new('Funk')

music = Music.new('2000-01-01', on_spotify: true)

describe Genre do
  context 'class when instantiated' do
    it 'should initiate with a (name) parameter and be able to access it.' do
      expect(genre.name).to eq 'Funk'
    end

    it 'should be able to add_item(music) to the genre instace @items = []' do
      genre.add_item(music)
      expect(genre.items.length).to eq 1
    end
  end
end
