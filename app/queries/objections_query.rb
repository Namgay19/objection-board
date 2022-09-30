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
    if params[:sort_by].present?
      "#{params[:sort_by]} DESC"
    else
      'created_at DESC'
    end
  end
end
