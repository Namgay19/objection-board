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

  def filter_by_effect(t)
    t.where(effect: effect)
  end

  def filter_by_time(t)
    t.where(start_time: filter_date.beginning_of_day..filter_date.end_of_day)
  end

  def effect
    params[:effect] || "positive"
  end

  def filter_date
    params[:date] || DateTime.now
  end
end
