require_relative 'item'
require_relative 'genre'

class Music < Item
  attr_reader :on_spotify

  def initialize(author, source, label, publish_date, on_spotify: false)
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
    @genre = genre
  end

  def can_be_archived?
    if can_be_archived? && on_spotify
      true
    else
      false
    end
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end
end

item = Music.new('Anitta', 'Youtube', 'Poderosas', '2005-01-30')
puts item.genre
genre = Genre.new('Funk')
item.genre = (genre)
puts item.genre.name
puts genre.name
