class RevenueMailer < ApplicationMailer
  def daily_reminder(id)
    @revenue = Revenue.find(id)
    @user = @revenue.user
    mail(to: @user.email, subject: 'Update daily revenue.')
  end
end
