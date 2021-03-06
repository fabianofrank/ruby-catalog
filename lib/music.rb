require_relative 'item'
require_relative 'genre'

class Music < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify: false)
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
    @genre = genre
  end

  def can_be_archived?
    super && on_spotify
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end
end
