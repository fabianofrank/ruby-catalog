require_relative '../lib/genre'
require_relative '../lib/music'

genre = Genre.new('Funk')

music = Music.new(on_spotify: true)

describe Genre do
  context 'class when instanted' do
    it 'should initiate all parameters and be able to access them.' do
      expect(music.on_spotify).to eq true
    end

    it 'should be able to check if can_be_archived? return true or false' do
      expect(music.can_be_archived?).to eq true
    end

    it "should be able to set the genre in the music object and add the music to the genre object's @items instace" do
      music.genre = (genre)
      expect(music.genre.name).to eq 'Funk'
      expect(genre.items).to eq [music]
    end
  end
end
