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
end
