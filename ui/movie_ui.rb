require_relative '../lib/movie'
require_relative '../lib/source'

class MovieUi
  def initialize
    @all_movies = []
    @list_sources = []
  end

  def run
    puts '1- List all movies'
    puts '2- List all sources'
    puts "3- Add movie\n "
    print 'Select one from options: '
    option = gets.chomp
    case option
    when '1'
      @all_movies.each { |i| puts i.label }
      run
    when '2'
      @list_sources.each { |i| puts i.name }
      run
    when '3' then add_movie
    end
  end

  def add_movie
    print 'Movie name: '
    movie_name = gets.chomp
    print 'Movie published date: '
    movie_published_date = gets.chomp
    print 'Movie source: '
    movie_source = gets.chomp
    create_data = Movie.new(movie_published_date, movie_name)
    source_data = Source.new(movie_source)
    @list_sources << source_data
    @all_movies << create_data
    # Commented
    puts 'Movie added'
    run
  end
end
member = MovieUi.new
member.run
