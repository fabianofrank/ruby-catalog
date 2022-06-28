require_relative 'item'

class Movie < Item
  def initialize(silet)
    super()
    @silet = silet
  end

  # Movie method
  def can_be_archived?
    can_be_archived? || @silent == true
  end
end
