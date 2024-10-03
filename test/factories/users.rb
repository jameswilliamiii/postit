FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    name { "MyString" }
    password_digest { "MyString" }
  end
end
