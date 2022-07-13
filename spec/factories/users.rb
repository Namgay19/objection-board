FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    first_name { Faker::Superhero.name }
    last_name { Faker::Superhero.name }
    phone { '17617569' }
    mobile { '17617569' }
    confirmed_at { DateTime.now }
    hashed_pin { '123456' }
  end
end
