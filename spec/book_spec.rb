require_relative '../lib/book'

describe 'Book test' do
  book = Book.new('Author 01', 'Label 01', '2022-01-01', 'bad')

  context 'New Book' do
    it 'should be a book' do
      expect(book).to be_a(Book)
    end
  end

  describe 'Passing parameters' do
    context '#Author' do
      it 'returns the correct Author' do
        expect(book.author).to eq('Author 01')
      end
    end

    context '#Label' do
      it 'returns the correct label' do
        expect(book.label).to eq('Label 01')
      end
    end

    context '#Publish Date' do
      it 'returns the correct publish date' do
        expect(book.publish_date).to eq('2022-01-01')
      end
    end

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

    it 'push into lable items' do
      expect(book.label).to eq('Label 01')
    end
  end
end
