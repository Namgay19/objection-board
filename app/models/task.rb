class Task < ApplicationRecord
  belongs_to :user

  enum category: {
    prospecting: 0,
    crm_work: 5,
    meetings: 10,
    emails: 15,
    lunch: 17,
    new_calls: 20,
    follow_up_calls: 25,
    presentations: 30,
    miscellaneous: 35,
    social_media: 40,
    gossiping: 45,
    gaming: 50
  }

  enum effect: { positive: 0, negative: 5 }

  validates_presence_of :start_time, :end_time
  validates_with TimeValidator

  scope :by_day, ->(date) { where(:start_time => date.beginning_of_day..date.end_of_day) }
  scope :by_week, ->(date) { where(:start_time => date.beginning_of_week..date.end_of_week) }
  scope :by_month, ->(date) { where(:start_time => date.beginning_of_month..date.end_of_month) }
  scope :by_year, ->(date) { where(:start_time => date.beginning_of_year..date.end_of_year) }

  def starting_time
    start_time.strftime('%I %p')
  end

  def ending_time
    end_time.strftime('%I %p')
  end

  def duration
    "#{((end_time - start_time) / 3600).round(1)} hours"
  end

  def extra_time
    yesterdays_time = 0
    todays_time = total_time_by_day

    user.tasks.by_day(start_time - 1.day).where(category: category).each do |t|
      yesterdays_time += t.end_time - t.start_time
    end

    ((todays_time - yesterdays_time) / 60).round
  end

  def duration_per_day
    total_duration = 0

    todays_time = total_time_by_day
    user.tasks.by_day(start_time).each do |t|
      total_duration += t.end_time - t.start_time
    end

    total_duration = (total_duration / 60)

    ((todays_time/total_duration) * 100).round(2)
  end

  def duration_per_week
    total_duration = 0

    todays_time = total_time_by_week
    user.tasks.by_week(start_time).each do |t|
      total_duration += t.end_time - t.start_time
    end

    total_duration = (total_duration / 60)

    ((todays_time/total_duration) * 100).round(2)
  end

  def duration_per_month
    total_duration = 0

    todays_time = total_time_by_month
    user.tasks.by_month(start_time).each do |t|
      total_duration += t.end_time - t.start_time
    end

    total_duration = (total_duration / 60)

    ((todays_time/total_duration) * 100).round(2)
  end

  def duration_per_year
    total_duration = 0

    todays_time = total_time_by_year
    user.tasks.by_year(start_time).each do |t|
      total_duration += t.end_time - t.start_time
    end

    total_duration = (total_duration / 60)

    ((todays_time/total_duration) * 100).round(2)
  end

  def total_time_by_day
    todays_total = 0
    user.tasks.by_day(start_time).where(category: category).each do |t|
      todays_total += t.end_time - t.start_time
    end
    (todays_total / 60).round
  end

  def total_time_by_week
    todays_total = 0
    user.tasks.by_week(start_time).where(category: category).each do |t|
      todays_total += t.end_time - t.start_time
    end
    (todays_total / 60).round
  end

  def total_time_by_month
    todays_total = 0
    user.tasks.by_month(start_time).where(category: category).each do |t|
      todays_total += t.end_time - t.start_time
    end
    (todays_total / 60).round
  end

  def total_time_by_year
    todays_total = 0
    user.tasks.by_year(start_time).where(category: category).each do |t|
      todays_total += t.end_time - t.start_time
    end
    (todays_total / 60).round
  end
end
