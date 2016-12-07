require 'rails_helper'

RSpec.describe Author, type: :model do
  it  "should have a valid factory" do
    expect(FactoryGirl.build(:author)).to be_valid
  end

  it "should require email" do
    expect(FactoryGirl.build(:author, email: "")).not_to be_valid
  end

  it { is_expected.to validate_presence_of(:first_name) }

  context 'with an all-upcase last_name and all-lowercase first_name' do
    let(:author) { FactoryGirl.build(:author, first_name: 'john', last_name: 'SMITH') }

    it 'should be titleized after save' do
      author.save
      expect(author.reload.to_s).to eq('John Smith')
    end
  end

  context 'with an all-upcase last_name and all-lowercase first_name' do
    let(:author) { FactoryGirl.build(:author, first_name: 'john', last_name: nil) }

    it 'should be titleized after save' do
      author.save
      expect(author.reload.to_s).to eq('John')
    end
  end
end
