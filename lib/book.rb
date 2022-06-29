require_relative 'item'
require_relative 'label'

class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(author, label, publish_date, cover_state, publisher: false)
    super(genre, author, source, label, publish_date)
    @cover_state = cover_state
    @publisher = publisher
    @label = label
  end

  def can_be_archived?
    can_be_archived? || @cover_state == 'bad'

    false
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end
end
