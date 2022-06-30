#!/usr/bin/env ruby
require_relative './ui/book_ui'
require_relative './ui/movie_ui'
require_relative './ui/game_ui'
require_relative './ui/music_ui'

class Main
  def interface
    puts "\nPlease choose an option by entering a number:"
    puts '1 - Book Menu'
    puts '2 - Music Menu'
    puts '3 - Games Menu'
    puts '4 - Movie Menu'
    puts '5 - Exit'
  end

  def menu
    loop do
      interface
      selection = gets.chomp.to_i
      case selection
      when 1 then BookUi.new.run
      when 2 then MusicUi.new.run
      when 3 then GameUi.new.run
      when 4 then MovieUi.new.run
      when 5
        puts 'Thank you for using the Catalog of things App!'
        break
      else
        puts "Don't say goodbye, bye, bye..."
      end
    end
  end
end

Main.new.menu
