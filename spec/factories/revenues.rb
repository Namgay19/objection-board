FactoryBot.define do
  factory :revenue do
    user { nil }
    sales_target { 1 }
    sales_amount { 1 }
    year { "2022-10-19 10:45:25" }
  end
end
