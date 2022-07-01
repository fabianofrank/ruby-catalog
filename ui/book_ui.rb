require_relative '../lib/book'
require_relative '../preservation/book_data'

class BookUi
  def initialize
    @books = []
    @label = []
    @book_data = BookData.new
    @book_save = []
  end

  def menu
    puts 'Welcome to the book archive!'
    puts 'What would you like to do?'
    puts '1. Add a book'
    puts '2. List all books'
    puts '3. List all labels'
    puts '4. Go back'
  end

  def run
    loop do
      menu
      selection = gets.chomp.to_i
      case selection
      when 1 then add_book
      when 2 then list_books
      when 3 then list_labels
      when 4 then break
      else
        puts 'Invalid selection, please try again'
      end
    end
  end

  def add_book
    puts 'What is the title of the book?'
    title = gets.chomp
    puts 'color of the book?'
    color = gets.chomp
    puts 'What is the published date?'
    published_date = gets.chomp
    puts 'What is the cover state?'
    cover_state = gets.chomp
    book = Book.new(published_date, cover_state)
    label = Label.new(title, color)
    book.label = (label)
    @label << label
    @books << book
  end

  def list_books
    puts 'Here are all the books:'
    @books.map do |book|
      puts "Title: #{book.label.title} Publish Date: (#{book.publish_date})"
    end
  end

  def save_data
    @books.each do |book|
      @book_save << { 'published_date' => book.publish_date, 'cover_state' => book.cover_state,
                      'title' => book.label.title, 'color' => book.label.color }
    end
    @book_data.create_data(@book_save)
  end

  def load_data
    @book_data.read_data&.each do |book|
      @books << Book.new(book['published_date'], book['cover_state'])
      @label << Label.new(book['title'], book['color'])
      @books.last.label = @label.last
    end
  end

  def list_labels
    puts 'Here are all the labels:'
    @label.map do |label|
      puts "Title: #{label.title} Color: #{label.color}"
    end
  end
end
