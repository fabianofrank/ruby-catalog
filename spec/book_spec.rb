require_relative '../lib/book'

describe 'Book test' do
  book = Book.new('bad', publisher: true)

  context 'New Book' do
    it 'should be a book' do
      expect(book).to be_a(Book)
    end
  end

  describe 'Passing parameters' do
    context '#Cover State' do
      it 'returns the correct person' do
        expect(book.cover_state).to eq('bad')
      end
    end
  end

  describe '#Can Be Archived? Method' do
    it 'has a can_be_archived? method' do
      expect(book).to respond_to(:can_be_archived?)
    end
  end

  describe '#Label Method' do
    it 'has a label method' do
      expect(book).to respond_to(:label)
    end
  end
end
