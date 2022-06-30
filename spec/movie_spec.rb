require_relative '../lib/movie'

describe Movie do
  context 'when functions calls' do
    it 'movie method should function properly' do
      movie_instance = Movie.new('fantasy', 'blaa', 'label', '2022/10/31', silent: true)
      movie_instance.can_be_archived?
      expect(movie_instance.silent).to be_truthy
    end
  end
end
