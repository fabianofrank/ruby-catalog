require_relative '../lib/movie'
require_relative '../lib/source'
require_relative '../preservation/movie_data'

class MovieUi
  def initialize
    @all_movies = []
    @list_sources = []
    @movies_data = MovieData.new
    @to_json = []
  end

  def load_data
    @movies_data.read_movie_data&.each do |i|
      @all_movies << Movie.new(i['publish_date'], i['movie_name'])
      @list_sources << Source.new(i['movie_source'])
      @all_movies.last.source = @list_sources.last
    end
  end

  def save_data
    @all_movies.each do |i|
      @to_json << {
        'publish_date' => i.publish_date,
        'movie_name' => i.label,
        'movie_source' => i.source.name
      }
    end
    @movies_data.movie_create(@to_json)
  end

  def list_all_movies
    @all_movies.each do |i|
      puts "Published date: #{i.publish_date} Name: #{i.label}"
    end
  end

  def list_sources
    @list_sources.each do |i|
      puts "Source: #{i.name}"
    end
  end

  def options
    puts '1- List all movies'
    puts '2- List all sources'
    puts "3- Add movie\n "
    print 'Select one from options: '
  end

  def run
    options
    option = gets.chomp
    case option
    when '1'
      list_all_movies
      run
    when '2'
      list_sources
      run
    when '3'
      add_movie
      run
    else
      puts "\nInvalid selection, please try again"
    end
  end

  def movie_name
    print 'Movie name: '
    gets.chomp
  end

  def movie_published
    print 'Movie published date: '
    gets.chomp
  end

  def movie_source
    print 'Movie source:'
    gets.chomp
  end

  def add_movie
    create_data = Movie.new(movie_published, movie_name)
    source_data = Source.new(movie_source)
    create_data.source = (source_data)
    @all_movies << create_data
    @list_sources << source_data
    puts 'Movie added'
    run
  end
end
