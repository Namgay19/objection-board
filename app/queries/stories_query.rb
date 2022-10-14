class StoriesQuery
  attr_reader :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def run
    if params[:sort_by] == 'viewed_at'
      viewed_stories = stories.where.not(viewed_at: nil)
      if viewed_stories.present?
        viewed_stories.order('viewed_at DESC')
      else
        []
      end
    else
      stories.order('created_at DESC')
    end
  end

  def stories
    @stories ||= current_user.stories
  end
end
