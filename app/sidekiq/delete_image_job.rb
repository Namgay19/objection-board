class DeleteImageJob
  include Sidekiq::Job

  def perform(id)
    image = Image.find(id)
    image.destroy! if image.imageable_id.nil?
  end
end
