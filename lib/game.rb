require_relative 'item'
require 'date'
require_relative 'author'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super()
    @multiplayer = multiplayer
    @last_played_at = Time.new(last_played_at.to_i)
  end

  def can_be_archived?
    ## should return true if parent's method returns true AND if last_played_at is older than 2 years
    super && Time.new.year - last_played_at.year >= 2
  end
end
