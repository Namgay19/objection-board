class DealsQuery
  attr_reader :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  DealGoal = Struct.new(:id, :identifier, :total_deals, :target_comparison, :target_to_achieve, :on_target)
  MetaInfo = Struct.new(:daily_target, :weekly_target, :monthly_target, :yearly_target)

  def run
    if params[:filter_type] == 'year'
      records = yearly_returns
    elsif params[:filter_type] == 'month'
      records = monthly_returns
    elsif params[:filter_type] == 'week'
      records = weekly_returns
    else
      records = daily_returns
    end
    meta_info = MetaInfo.new(deal.daily_target, deal.weekly_target, deal.monthly_target, deal.deal_target)
    [records, meta_info]
  end

  def deal
    @deal ||= current_user.deals.find_by(year: year)
  end

  def year
    params[:date]&.beginning_of_year || DateTime.current.beginning_of_year
  end

  def month
    params[:date]&.beginning_of_month || DateTime.current.beginning_of_month
  end

  def week
    params[:date]&.beginning_of_week || DateTime.current.beginning_of_week
  end

  def yearly_returns
    current_user.deals.each_with_object([]) do |deal, result|
      result << DealGoal.new(
        nil,
        deal.year.year.to_s,
        deal.deal_amount,
        deal.deal_amount - deal.deal_target,
        target_to_achieve(deal.deal_amount, deal.deal_target),
        (deal.deal_amount.to_f / deal.deal_target).round(2) * 100
      )
    end
  end

  def monthly_returns
    total_deal = 0
    deal.daily_deals.each_with_object([]) do |daily_deal, result|
      total_deal += daily_deal.amount
      next unless daily_deal.start_time.day == daily_deal.start_time.end_of_month.day

      result << DealGoal.new(
        nil,
        daily_deal.start_time.strftime('%B'),
        total_deal,
        total_deal - deal.monthly_target,
        target_to_achieve(total_deal, deal.monthly_target),
        (total_deal.to_f / deal.monthly_target).round(2) * 100
      )
      total_deal = 0
    end
  end

  def weekly_returns
    total_deal = 0
    counter = 1

    deal.daily_deals.by_weeks(month).each_with_object([]) do |daily_deal, result|
      total_deal += daily_deal.amount
      next unless daily_deal.start_time.day == daily_deal.start_time.end_of_week.day

      result << DealGoal.new(
        nil,
        "Week #{counter}",
        total_deal,
        total_deal - deal.weekly_target,
        target_to_achieve(total_deal, deal.weekly_target),
        (total_deal.to_f / deal.weekly_target).round(2) * 100
      )
      total_deal = 0
      counter += 1
    end
  end

  def daily_returns
    deal.daily_deals.by_days(week).each_with_object([]) do |daily_deal, result|
      result << DealGoal.new(
        daily_deal.id,
        daily_deal.start_time.strftime("%A"),
        daily_deal.amount,
        daily_deal.amount - deal.daily_target,
        target_to_achieve(daily_deal.amount, deal.daily_target),
        (daily_deal.amount.to_f / deal.daily_target).round(2) * 100
      )
    end
  end

  def target_to_achieve(deal_amount, deal_target)
    deal_amount >= deal_target ? 0 : deal_target - deal_amount
  end
end