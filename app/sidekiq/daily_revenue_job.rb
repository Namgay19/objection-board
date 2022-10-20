class DailyRevenueJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform(id)
    revenue = Revenue.find(id)
    revenue.transaction do
      (revenue.year.to_datetime.beginning_of_year..revenue.year.to_datetime.end_of_year).each do |day|
        DailyRevenue.create!(revenue_id: revenue.id, amount: 0, start_time: day)
      end
    end
  end
end
