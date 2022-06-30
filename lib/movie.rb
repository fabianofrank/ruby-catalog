require_relative 'item'
class Movie < Item
  attr_accessor :silent

  def initialize(publish_date, silent: false)
    super(genre, author, source, label, publish_date)
    @silent = silent
    @source = source
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  # Methods
  def can_be_archived?
    super || @silent == true
  end
end
