require 'rails_helper'

RSpec.describe Author, type: :model do
  it  "should have a valid factory" do
    expect(FactoryGirl.build(:author)).to be_valid
  end

  it "should require email" do
    expect(FactoryGirl.build(:author, email: "")).not_to be_valid
  end

  it { is_expected.to validate_presence_of(:first_name) }
end
