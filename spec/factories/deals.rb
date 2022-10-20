FactoryBot.define do
  factory :deal do
    user { nil }
    deal_target { 1 }
    deal_amount { 1 }
    year { "2022-10-19 10:45:47" }
  end
end
