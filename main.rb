require_relative './ui/book_ui'
require_relative './ui/movie_ui'
require_relative './ui/game_ui'
require_relative './ui/music_ui'

class Main
  def initialize
    @book_ui = BookUi.new
    @music_ui = MusicUi.new
    @game_ui = GameUi.new
    @movie_ui = MovieUi.new
  end

  def interface
    puts "\nPlease choose an option by entering a number:"
    puts '1 - Book Menu'
    puts '2 - Music Menu'
    puts '3 - Games Menu'
    puts '4 - Movie Menu'
    puts '5 - Exit'
  end

  def menu
    @game_ui.load_data
    loop do
      interface
      selection = gets.chomp.to_i
      case selection
      when 1 then @book_ui.run
      when 2 then @music_ui.run
      when 3 then @game_ui.run
      when 4 then @movie_ui.run
      when 5
        puts 'Thank you for using the Catalog of things App!'
        @game_ui.save_data
        break
      else
        puts 'Invalid selection, please try again'
      end
    end
  end
end

Main.new.menu
