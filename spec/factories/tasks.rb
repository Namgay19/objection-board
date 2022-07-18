FactoryBot.define do
  factory :task do
    category { 'prospecting' }
    start_time { DateTime.now }
    end_time { DateTime.now + 1.hour }
  end
end
