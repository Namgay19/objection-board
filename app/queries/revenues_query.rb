class RevenuesQuery
  attr_reader :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  RevenueGoal = Struct.new(:id, :identifier, :total_revenue, :target_comparison, :target_to_achieve, :on_target, :currency)
  MetaInfo = Struct.new(:daily_target, :weekly_target, :monthly_target, :yearly_target, :client_annual_revenue)

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
    meta_info = MetaInfo.new(revenue.daily_target, revenue.weekly_target, revenue.monthly_target, revenue.sales_target, revenue.client_annual_revenue)
    [records, meta_info]
  end

  def revenue
    @revenue ||= current_user.revenues.find_by(year: year)
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
    current_user.revenues.each_with_object([]) do |revenue, result|
      result << RevenueGoal.new(
        nil,
        revenue.year.year.to_s,
        revenue.sales_amount,
        revenue.sales_amount - revenue.sales_target,
        target_to_achieve(revenue.sales_amount, revenue.sales_target),
        (revenue.sales_amount.to_f / revenue.sales_target).round(2) * 100,
        revenue.currency
      )
    end
  end

  def monthly_returns
    total_revenue = 0
    revenue.daily_revenues.each_with_object([]) do |daily_revenue, result|
      total_revenue += daily_revenue.amount
      next unless daily_revenue.start_time.day == daily_revenue.start_time.end_of_month.day

      result << RevenueGoal.new(
        nil,
        daily_revenue.start_time.strftime('%B'),
        total_revenue,
        total_revenue - revenue.monthly_target,
        target_to_achieve(total_revenue, revenue.monthly_target),
        (total_revenue.to_f / revenue.monthly_target).round(2) * 100,
        revenue.currency
      )
      total_revenue = 0
    end
  end

  def weekly_returns
    total_revenue = 0
    counter = 1

    revenue.daily_revenues.by_weeks(month).each_with_object([]) do |daily_revenue, result|
      total_revenue += daily_revenue.amount
      next unless daily_revenue.start_time.day == daily_revenue.start_time.end_of_week.day

      result << RevenueGoal.new(
        nil,
        "Week #{counter}",
        total_revenue,
        total_revenue - revenue.weekly_target,
        target_to_achieve(total_revenue, revenue.weekly_target),
        (total_revenue.to_f / revenue.weekly_target).round(2) * 100,
        revenue.currency
      )
      total_revenue = 0
      counter += 1
    end
  end

  def daily_returns
    revenue.daily_revenues.by_days(week).each_with_object([]) do |daily_revenue, result|
      result << RevenueGoal.new(
        daily_revenue.id,
        daily_revenue.start_time.strftime("%A"),
        daily_revenue.amount,
        daily_revenue.amount - revenue.daily_target,
        target_to_achieve(daily_revenue.amount, revenue.daily_target),
        (daily_revenue.amount.to_f / revenue.daily_target).round(2) * 100,
        revenue.currency
      )
    end
  end

  def target_to_achieve(sales_amount, sales_target)
    sales_amount >= sales_target ? 0 : sales_target - sales_amount
  end
end