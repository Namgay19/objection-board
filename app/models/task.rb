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

  default_scope { order(:start_time) }

  enum effect: { positive: 0, negative: 5 }

  validates_presence_of :start_time, :end_time
  validates_with TimeValidator

  scope :daily, -> { where(:start_time => DateTime.now.beginning_of_day..DateTime.now.end_of_day) }
  scope :past_day, -> { where(:start_time => (DateTime.now - 1.day).beginning_of_day..(DateTime.now - 1.day).end_of_day) }

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
    todays_time = 0
    yesterdays_time = 0
    user.tasks.daily.where(category: category).each do |t|
      todays_time += t.end_time - t.start_time
    end

    user.tasks.past_day.where(category: category).each do |t|
      yesterdays_time += t.end_time - t.start_time
    end

    ((todays_time - yesterdays_time) / 60).round
  end
end
