require 'json'
require './lib/movie'

class MovieData
  def movie_create(movie)
    File.write('data/movie_data.json', JSON.pretty_generate(movie))
  end

  def read_movie_data
    if !File.zero?('data/movie_data.json') && File.exist?('data/movie_data.json')
      file = File.open 'data/movie_data.json'
      data = JSON.parse file.read
      file.close
    end
    data
  end
end
