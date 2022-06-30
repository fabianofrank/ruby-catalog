require_relative 'item'

class Source
  attr_accessor :name, :items
  attr_reader :item

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  #   add function
  def add_item(item)
    @items << item
    item.source = self
  end
end
