class ObjectionsQuery
  attr_reader :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def run
    objections.order(sort_by)
  end

  def objections
    @objections ||= current_user.objections
  end

  def sort_by
    "#{params[:sort_by]} DESC" || 'created_at DESC'
  end
end
