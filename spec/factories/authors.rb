FactoryGirl.define do
  factory :author do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { "#{first_name}@#{last_name}.com".downcase }

    trait :complete_address do
      city "MyString"
      address "MyString"
    end

    trait :contact_data do
      phone "MyString"
      website "MyString"
    end

    factory :author_full_data, traits: [:complete_address, :contact_data]
  end
end
