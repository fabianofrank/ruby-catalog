require_relative '../lib/music'
require_relative '../lib/genre'

class MusicUi
  def initialize
    @album = []
    @genre = []
  end

  def interface
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all music albums'
    puts '2 - List all genres'
    puts '3 - Add a music album'
    puts '4 - Go back!'
  end

  def run
    loop do
      interface
      selection = gets.chomp.to_i
      case selection
      when 1 then list_albums
      when 2 then list_genres
      when 3 then add_album
      when 4
        break
      else
        puts "\nInvalid selection, please try again"
      end
    end
  end

  def list_albums
    @album.each_with_index do |music, index|
      puts "\n#{index}) Published: #{music.publish_date} Available on Spotify: #{music.on_spotify}\n"
    end
  end

  def list_genres
    @genre.each_with_index do |genre, index|
      puts "\n#{index}) Genre: #{genre.name}\n"
    end
  end

  def publish_date
    print 'Album publish date: '
    gets.chomp.strip
  end

  def on_spotify
    print 'Is it on Spotify? [Y/N]: '
    gets.chomp.strip.to_s.downcase == 'y'
  end

  def album_genre
    print 'What is the genre of the album? '
    gets.chomp.strip.to_s.capitalize
  end

  def add_album
    music = Music.new(publish_date, on_spotify: on_spotify)
    genre = Genre.new(album_genre)
    music.genre = (genre)
    @album << music
    @genre << genre
    puts "\nAlbum created!"
  end
end
