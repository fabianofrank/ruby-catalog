require_relative '../lib/genre'
require_relative '../lib/music'

genre = Genre.new('Funk')

music = Music.new('Anitta', 'Youtube', 'Poderosas', '2005-01-30')

describe Genre do
  context 'class when instanted' do
    it 'should initiate all parameters and be able to access them.' do
      expect(music.author).to eq 'Anitta'
      expect(music.source).to eq 'Youtube'
      expect(music.label).to eq 'Poderosas'
      # expect(music.publish_date).to eq '2005-01-30'
      expect(music.on_spotify).to eq false
    end

    it 'should be able to check if can_be_archived? return true or false' do
      music.genre = (genre)
      expect(music.genre.name).to eq 'Funk'
      expect(genre.name).to eq 'Funk'
    end

    it "should be able to set the genre in the music object and add the music to the genre object's @items instace" do
      music.genre = (genre)
      expect(music.genre.name).to eq 'Funk'
      expect(genre.items).to eq [music]
    end
  end
end
