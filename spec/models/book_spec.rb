require 'rails_helper'

RSpec.describe Book, type: :model do
  it "should have a valid factory" do
    expect(FactoryGirl.build(:book)).to be_valid
  end

  it "should require author on new book" do
    expect(FactoryGirl.build(:book, author_id: nil)).not_to be_valid
  end

  it "should require author on new book" do
    expect(FactoryGirl.build(:book, created_at: 1.minute.ago, author_id: nil)).not_to be_valid
  end

  it "should require author on new book" do
    expect(FactoryGirl.build(:book, created_at: Date.new(2015, 1, 1), author_id: nil)).to be_valid
  end

  describe "price_with_vat" do
    context "with VAT 5%" do
      before { stub_const("Book::BOOK_VAT", 5) }

      it "should apply BOOK_VAT" do
        expect(Book.new(price: 100).price_with_vat).to eq(105)
      end

      it "should support really big numbers" do
        expect(Book.new(price: 100_000_000).price_with_vat).to eq(105_000_000)
      end
    end

    it "should return 0 with price 0" do
      expect(Book.new(price: 0).price_with_vat).to eq(0)
    end

    it "should return nil with price nil" do
      expect(Book.new.price_with_vat).to eq(nil)
    end
  end

  describe "reviews_count" do
    let(:book) { FactoryGirl.create(:book) }

    context "with two reviews" do
      before { FactoryGirl.create_list(:review, 2, reviewable: book) }

      it "should return 2" do
        expect(book.reviews_count).to eq(2)
      end
    end

    context "with no reviews" do
      it "should return 0" do
        expect(book.reviews_count).to eq(0)
      end
    end
  end
end
