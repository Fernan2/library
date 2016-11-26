FactoryGirl.define do
  factory :book do
    title "MyString"
    author { FactoryGirl.create(:author) }
    description "MyString"
    year { (2000..2016).to_a.sample }
    available false
    section "MyString"
    shelf 1
    order 1
  end
end
