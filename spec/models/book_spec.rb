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
    it "should apply BOOK_VAT" do
      stub_const("Book::BOOK_VAT", 5)
      expect(Book.new(price: 100).price_with_vat).to eq(105)
    end

    it "should return 0 with price 0" do
      expect(Book.new(price: 0).price_with_vat).to eq(0)
    end

    it "should return nil with price nil" do
      expect(Book.new.price_with_vat).to eq(nil)
    end
  end
end
