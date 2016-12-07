require 'rails_helper'

describe 'authors CRUD' do
  context 'with an existing author' do
    let!(:author) { FactoryGirl.create(:author, first_name: 'Leo') }

    it 'should list the authors' do
      visit authors_path
      expect(page).to have_content('Leo')
      expect(page).to have_link('Show', href: author_path(author))
    end

    it 'should show the author' do
      visit author_path(author)
      expect(page).to have_link 'Back', href: authors_path
      expect(page).to have_css(:h1, text: 'Leo')
      expect(current_path).to eq author_path(author.id)
    end

    it 'should edit the author' do
      visit(edit_author_path(author))
      fill_in 'First name', with: 'Ana'
      click_button 'Save'
      expect(current_path).to eq author_path(author.id)
      expect(page).to have_css(:h1, text: 'Ana')
    end
  end
end
