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
      .then { |t| order_by_time(t) }
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
    when "month"
      t.where(start_time: start_date.beginning_of_month..start_date.end_of_month).select("DISTINCT ON (category) *")
    when "week"
      t.where(start_time: start_date.beginning_of_week..start_date.end_of_week).select("DISTINCT ON (category) *")
    else
      t.where(start_time: start_date.beginning_of_day..start_date.end_of_day)
    end
  end

  def effect
    params[:effect] || "positive"
  end

  def start_date
    params[:date] || DateTime.now
  end

  def filter_type
    params[:filter] || "day"
  end
end
