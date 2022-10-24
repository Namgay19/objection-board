class DailyNotificationJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform(id)
    revenue = Revenue.find(id)
    RevenueMailer.daily_reminder(id).deliver_now
    Notification.create!(user: revenue.user, message: "Update your daily revenue for #{DateTime.current.strftime("%d %B %Y")}")
  end
end
