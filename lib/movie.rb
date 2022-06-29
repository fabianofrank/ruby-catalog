require_relative 'item'
class Movie < Item
  attr_reader :silent

  def initialize(genre, source, label, publish_date, silent)
    super(genre, source, label, publish_date, silent)
    @silent = silent
    @source = source
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  # Methods
  def can_be_archived?
    can_be_archived? || @silent == true
  end
end
