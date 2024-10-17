FactoryBot.define do
  factory :post do
    user
    organization
    title { "MyString" }
  end
end
