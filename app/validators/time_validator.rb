class TimeValidator < ActiveModel::Validator
  def validate(record)
    daily_tasks = record.user.tasks.by_day(record.start_time)
    if daily_tasks.any? { |task| time_allocated?(record, task) }
      record.errors.add :base, 'You have already allocated the time for another task'
    end

    if record.start_time > record.end_time
      record.errors.add :base, 'Start time cannot be ahead of the end time'
    end
  end

  def time_allocated?(record, task)
    (record.start_time > task.start_time && record.start_time < task.end_time) || (record.start_time < task.start_time && record.end_time > task.start_time)
  end
end
