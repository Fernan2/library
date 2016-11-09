FactoryGirl.define do
  factory :book do
    title "MyString"
    author { FactoryGirl.create(:author) }
    description "MyString"
    year 1
    available false
    section "MyString"
    shelf 1
    order 1
  end
end
