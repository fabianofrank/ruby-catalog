require 'json'
require './lib/book'

class BookData
  def create_data(book)
    File.write('data/book_data.json', JSON.pretty_generate(book))
  end

  def read_data
    if !File.zero?('data/book_data.json') && File.exist?('data/book_data.json')
      file = File.open 'data/book_data.json'
      data = JSON.parse file.read
      file.close
    end
    data
  end
end
