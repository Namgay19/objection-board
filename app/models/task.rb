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
    miscellaneous: 35
  }

  validates_presence_of :start_time, :end_time

  def starting_time
    start_time.strftime('%I %p')
  end

  def ending_time
    end_time.strftime('%I %p')
  end

  def duration
    "#{(end_time - start_time) / 3600} hours"
  end
end
