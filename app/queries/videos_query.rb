class VideosQuery
  attr_reader :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def run
    if params[:sort_by] == 'viewed_at'
      viewed_videos = videos.where.not(viewed_at: nil)
      if viewed_videos.present?
        viewed_videos.order('viewed_at DESC')
      else
        []
      end
    else
      videos.order('created_at DESC')
    end
  end

  def videos
    @videos ||= current_user.videos
  end
end
