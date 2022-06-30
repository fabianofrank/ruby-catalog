require_relative '../lib/movie'

describe Movie do
  context 'when functions calls' do
    it 'movie method should function properly' do
      movie_instance = Movie.new('2000-01-01', silent: false)
      expect(movie_instance.can_be_archived?).to eq true
      expect(movie_instance.silent).to be_falsey
    end
  end
end
