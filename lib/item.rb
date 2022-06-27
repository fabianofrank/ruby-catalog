class Item
  attr_reader :genre, :author, :source, :label, :publish_date
  attr_accessor :archived

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    ten = 10
    publish_date > ten.to_s.years.ago
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end

puts Item.new('scifi', 'isaac azimov', 'something', 'foundation', '2020/12/31').can_be_archived?
