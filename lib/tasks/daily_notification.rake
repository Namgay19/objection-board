namespace :daily_notification do
  task send_reminder: :environment do
    User.where.not(confirmed_at: nil).each do |user|
      revenue = user.revenues.find_by("year >= ? AND year <= ?", DateTime.current.beginning_of_year, DateTime.current.end_of_year)
      next if revenue.nil?

      DailyNotificationJob.perform_at(revenue.notification_time.to_time, revenue.id)
    end
  end
end
