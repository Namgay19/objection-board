namespace :daily_task do
  task seed: :environment do
    User.where.not(confirmed_at: nil).each do |user|
      UserTaskUpdater.new(user).run
      puts "Done for user #{user.email}"
    end
  end
end
