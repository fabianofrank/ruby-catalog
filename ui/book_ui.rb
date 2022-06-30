require_relative '../lib/book'

class BookUi
  def initialize(books = [])
    @books = books
    @label = []
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

  def list_labels
    puts 'Here are all the labels:'
    @label.map do |label|
      puts "Title: #{label.title} Color: #{label.color}"
    end
  end
end
