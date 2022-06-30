require_relative '../lib/game'
require_relative '../preservation/game_data'

class GameUi
  def initialize
    @games = []
    @author = []
    @game_data = GameData.new
    @game_save = []
  end

  def menu
    puts 'Welcome to the game archive!'
    puts 'What would you like to do?'
    puts '1. Add a game'
    puts '2. List all games'
    puts '3. List all authors'
    puts '4. Go back'
  end

  def run
    loop do
      menu
      selection = gets.chomp.to_i
      case selection
      when 1 then add_game
      when 2 then list_games
      when 3 then list_authors
      when 4
        save_data
        break
      else
        puts 'Invalid selection, please try again'
      end
    end
  end

  def add_game
    puts 'What is the name of the game?'
    label = gets.chomp
    puts 'Author of the game? (first name)'
    author_fname = gets.chomp
    puts 'Author of the game? (last name)'
    author_lname = gets.chomp
    puts 'What is the published date?'
    published_date = gets.chomp
    puts 'What is the last played date?'
    last_played_at = gets.chomp
    puts 'Is it multiplayer? [y/n]'
    multiplayer = gets.chomp.downcase == 'y'
    game = Game.new(published_date, last_played_at, multiplayer, label)
    auth = Author.new(author_fname, author_lname)
    game.author = (auth)
    @author << auth
    @games << game
  end

  def list_games
    puts 'Here are all the games:'
    @games.map do |game|
      puts "#{game.label} (#{game.publish_date}) - is multiplayer: #{game.multiplayer}"
    end
  end

  def save_data
    @games.each do |game|
      @game_save << { 'published_date' => game.publish_date, 'last_played_at' => game.last_played_at,
                      'multiplayer' => game.multiplayer, 'label' => game.label, 'author' => game.author.to_s }
    end
    @game_data.create_data(@game_save)
  end

  def load_data
    @game_data.read_data&.each do |game|
      @games << Game.new(game['published_date'], game['last_played_at'], game['multiplayer'], game['label'])
    end
  end

  def list_authors
    puts 'Here are all the authors:'
    @author.map do |author|
      puts "#{author.first_name} #{author.last_name}"
    end
  end
end
