require 'date'

class Item
  attr_reader :genre, :author, :source, :label, :publish_date
  attr_accessor :archived

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Time.new(publish_date.to_i)
    @archived = archived
  end

  def can_be_archived?
    Time.new.year - publish_date.year >= 10
  end

  def move_to_archive
    @archived = false if can_be_archived?
  end

  private :can_be_archived?
end
