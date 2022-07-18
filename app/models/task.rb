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

  scope :daily, -> { where(:start_time => DateTime.now.beginning_of_day..DateTime.now.end_of_day) }

  def starting_time
    start_time.strftime('%I %p')
  end

  def ending_time
    end_time.strftime('%I %p')
  end

  def duration
    "#{((end_time - start_time) / 3600).round(1)} hours"
  end
end
