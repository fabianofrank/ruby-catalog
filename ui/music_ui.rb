require_relative '../lib/music'
require_relative '../lib/genre'
require_relative '../preservation/music_data'

class MusicUi
  def initialize
    @album = []
    @genre = []
    @music_save = []
    @music_data = MusicData.new
  end

  def interface
    puts "\nPlease choose an option by entering a number:"
    puts '1 - Add a music album'
    puts '2 - List all music albums'
    puts '3 - List all genres'
    puts '4 - Go back!'
  end

  def run
    loop do
      interface
      selection = gets.chomp.to_i
      case selection
      when 1 then add_album
      when 2 then list_albums
      when 3 then list_genres
      when 4
        save_data
        break
      else
        puts "\nInvalid selection, please try again"
      end
    end
  end

  # SOLID
  def publish_date
    print 'Album publish date: [yyyy/mm/dd] '
    gets.chomp.strip
  end

  def on_spotify
    print 'Is it on Spotify? [y/n]: '
    gets.chomp.strip.to_s.downcase == 'y'
  end

  def album_genre
    print 'What is the genre of the album? '
    gets.chomp.strip.to_s.capitalize
  end
  # SOLID

  def add_album
    music = Music.new(publish_date, on_spotify: on_spotify)
    genre = Genre.new(album_genre)
    music.genre = (genre)
    @album << music
    @genre << genre
    puts "\nAlbum created!"
  end

  def list_albums
    puts "Here are all the albums:\n"
    @album.each_with_index do |music, index|
      puts "\n#{index}) Published: #{music.publish_date} Available on Spotify: #{music.on_spotify}\n"
    end
  end

  def list_genres
    puts "Here are all the genres:\n"
    @genre.each_with_index do |genre, index|
      puts "\n#{index}) Genre: #{genre.name}\n"
    end
  end

  def save_data
    @album.each do |album|
      @music_save << { genre: album.genre.name, publish_date: album.publish_date, on_spotify: album.on_spotify }
    end
    @music_data.create_data(@music_save)
  end

  def load_data
    @music_data.read_data&.each do |album|
      @album << Music.new(album['publish_date'], on_spotify: album['on_spotify'])
      @genre << Genre.new(album['genre'])
    end
  end
end
