require_relative 'item'
require_relative 'genre'

class Music < Item
  attr_accessor :on_spotify

  def initialize(on_spotify: false)
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
