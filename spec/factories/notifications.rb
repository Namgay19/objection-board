FactoryBot.define do
  factory :notification do
    user { nil }
    message { "MyString" }
    category { 1 }
  end
end
