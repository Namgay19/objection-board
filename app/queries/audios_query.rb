class AudiosQuery
  attr_reader :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def run
    if params[:sort_by] == 'viewed_at'
      viewed_audios = audios.where.not(viewed_at: nil)
      if viewed_audios.present?
        viewed_audios.order('viewed_at DESC')
      else
        []
      end
    else
      audios.order('created_at DESC')
    end
  end

  def audios
    @audios ||= current_user.audios
  end
end
