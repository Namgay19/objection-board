class SetTasksJob
  include Sidekiq::Job

  def perform(id)
    user = User.find(id)
    UserTaskUpdater.new(user).run
  end
end
