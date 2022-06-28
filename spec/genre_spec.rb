require_relative '../genre'
require_relative '../music'

genre = Genre.new('Funk')

music = Music.new('Anitta', 'Youtube', 'Poderosas', '2005-01-30')

describe Genre do
  context 'When instantiating the Genre class' do
    it 'should initiate with a (name) parameter and be able to access it.' do
      expect(genre.name).to eq 'Funk'
    end

    it 'should be able add_item(music) to the genre instace @items = []' do
      classroom.add_student(student)
      expect(student.classroom.label).to eq '1A'
    end
  end
end







puts music.genre

music.genre = (genre)
puts music.genre.name
puts 
