class ApplicationSerializer < CacheCrispies::Base
  include Rails.application.routes.url_helpers

  def format_date(date)
    date&.strftime('%d/%m/%Y')
  end

  def format_time(time)
    time&.strftime('%d/%m/%Y %H:%M:%S')
  end

  def creator_name
    model.creator&.name
  end

  def creation_date
    format_time(model.created_at)
  end
end
