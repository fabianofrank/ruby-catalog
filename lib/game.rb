require_relative 'item'
require 'date'
require_relative 'author'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, last_played_at, multiplayer, label)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @label = label
  end

  def can_be_archived?
    ## should return true if parent's method returns true AND if last_played_at is older than 2 years
    super && Time.new.year - last_played_at.to_i >= 2
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end
end
