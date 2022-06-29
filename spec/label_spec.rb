require_relative '../lib/label'
require_relative '../lib/book'

describe 'Label test' do
  label = Label.new('First Name', 'Last Name')

  context 'New Label' do
    it 'should be a Label' do
      expect(label).to be_a(Label)
    end
  end

  describe 'Passing parameters' do
    context '#First Name' do
      it 'returns the correct first name' do
        expect(label.f_name).to eq('First Name')
      end
    end

    context '#Last Name' do
      it 'returns the correct last name' do
        expect(label.l_name).to eq('Last Name')
      end
    end
  end

  describe '#Add Item Method' do
    it 'has a add_item method' do
      expect(label).to respond_to(:add_item)
    end

    it 'Adding a label' do
      book = Book.new('author', 'label', '2022-01-01', 'cover_state')
      label.add_item(book)
      expect(label.items).to eq([book])
    end
  end
end
