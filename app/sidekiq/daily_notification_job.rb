class DailyNotificationJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform(id)
    RevenueMailer.daily_reminder(id).deliver_now
  end
end
