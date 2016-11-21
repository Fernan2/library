require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /books" do
    let(:author) { FactoryGirl.create(:author) }

    it "works! (now write some real specs)" do
      get author_books_path(author.id)
      expect(response).to have_http_status(200)
    end
  end
end
