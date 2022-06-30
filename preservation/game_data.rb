require 'json'
require './lib/game'

class GameData
  def create_data(game)
    File.write('data/game_data.json', JSON.pretty_generate(game))
  end

  def read_data
    if !File.zero?('data/game_data.json') && File.exist?('data/game_data.json')
      file = File.open 'data/game_data.json'
      data = JSON.parse file.read
      file.close
    end
    data
  end
end
