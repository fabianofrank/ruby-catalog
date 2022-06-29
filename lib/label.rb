class Label
  attr_accessor :label, :f_name, :l_name
  attr_reader :items

  def initialize(f_name, l_name)
    @id = Random.rand(1..1000)
    @f_name = f_name
    @l_name = l_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end