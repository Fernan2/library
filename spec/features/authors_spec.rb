require 'rails_helper'

describe 'authors CRUD' do
  context 'with an existing author' do
    before { FactoryGirl.create(:author, first_name: 'Leo') }

    it 'should be listed' do
      visit authors_path
      expect(page).to have_content('Leo')
    end
  end
end
