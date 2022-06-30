require 'json'
require './lib/game'

class GameData
  def create_data(game)
    File.write('game_data.json', JSON.pretty_generate(game))
  end

  def read_data
    unless File.zero?('game_data.json')
      file = File.open 'game_data.json'
        data = JSON.parse file.read
        file.close
    end
    data
  end
end
