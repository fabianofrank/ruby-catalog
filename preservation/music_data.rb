require 'json'
require './lib/music'

class MusicData
  def create_data(music)
    File.write('data/music_data.json', JSON.pretty_generate(music))
  end

  def read_data
    if !File.zero?('data/music_data.json') && File.exist?('data/music_data.json')
      fetch = JSON.parse(File.read('data/music_data.json'))
    end
    fetch
  end
end
