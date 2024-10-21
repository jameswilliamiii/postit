FactoryBot.define do
  factory :post do
    user
    organization
    title { "MyString" }
    message { "MyText" }
  end
end
