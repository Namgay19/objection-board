class TaskQuery
  attr_reader :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def run
    tasks
      .then { |t| filter_by_time(t) }
      .then { |t| filter_by_effect(t) }
  end

  def tasks
    @tasks ||= current_user.tasks
  end

  def order_by_time(t)
    t.order(:start_time)
  end

  def filter_by_effect(t)
    t.where(effect: effect)
  end

  def filter_by_time(t)
    case filter_type
    when "yearly"
      t.where(start_time: start_date.beginning_of_year..start_date.end_of_year).select("DISTINCT ON (category) *")
    when "monthly"
      t.where(start_time: start_date.beginning_of_month..start_date.end_of_month).select("DISTINCT ON (category) *")
    when "weekly"
      t.where(start_time: start_date.beginning_of_week..start_date.end_of_week).select("DISTINCT ON (category) *")
    else
      t.where(start_time: start_date.beginning_of_day..start_date.end_of_day).order(:start_time)
    end
  end

  def effect
    params[:effect] || "positive"
  end

  def start_date
    params[:date] || DateTime.now
  end

  def filter_type
    params[:filter] || "daily"
  end
end
