require_relative '../lib/source'
require_relative '../lib/movie'

movie_instance = Source.new('Dafne')
describe Source do
  context 'when functions calls' do
    it 'source should create an object' do
      expect(movie_instance.name).to eq 'Dafne'
    end

    it 'should add an item inside items array' do
      sample = Source.new('Firdavs')
      new_movie = Movie.new('fantasy', 'blaa', 'label', '2022/10/31')
      sample.add_item(new_movie)
      expect(sample.items).to include(new_movie)
    end
  end
end
