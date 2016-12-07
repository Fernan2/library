require 'rails_helper'

describe AuthorDecorator do
  describe 'title' do
    it 'should upcase the last_name' do
      expect(Author.new(last_name: 'Jall').decorate.title).to include('JALL')
    end
  end
end
