class UserTaskUpdater
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def run
    (DateTime.now..DateTime.new(2023, 1, 1)).each do |day|
      starting_hour = 9
      starting_time = day.to_time.beginning_of_day + starting_hour.hours
      Task.categories.keys.each do |category|
        next if category == 'miscellaneous'

        Task.create!(user_id: user.id, start_time: starting_time, end_time: starting_time + 1.hour, category: category)
        starting_time = starting_time + 1.hour
      end
    end
  end
end
