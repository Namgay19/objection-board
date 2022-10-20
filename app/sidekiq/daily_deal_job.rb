class DailyDealJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform(id)
    deal = Deal.find(id)
    deal.transaction do
      (deal.year.to_datetime.beginning_of_year..deal.year.to_datetime.end_of_year).each do |day|
        DailyDeal.create!(deal_id: deal.id, amount: 0, start_time: day)
      end
    end
  end
end
