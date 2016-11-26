FactoryGirl.define do
  factory :author do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.email }
    phone "MyString"
    city "MyString"
    address "MyString"
    website "MyString"
  end
end
