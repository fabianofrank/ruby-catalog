require_relative 'item'

class Source
  attr_accessor :source

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item = Item.new())
    @items << item
    source << self
  end
end
