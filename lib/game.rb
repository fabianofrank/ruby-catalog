require_relative 'item'
require 'date'
require_relative 'author'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(genre, source, label, publish_date, multiplayer)
    super(genre, author, source, label, publish_date)
    @author = author
    @multiplayer = multiplayer
    @last_played_at = nil
  end

  def can_be_archived?
    ## should return true if parent's method returns true AND if last_played_at is older than 2 years
    super && Time.new.year - last_played_at.year >= 2
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end
end
