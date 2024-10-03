FactoryBot.define do
  factory :user do
    sequence(:email_address) { |n| "test#{n}@example.com" }
    name { "MyString" }
    password { "MyString" }
    password_confirmation { "MyString" }
  end
end
