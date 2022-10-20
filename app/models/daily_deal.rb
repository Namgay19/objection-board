class DailyDeal < ApplicationRecord
  belongs_to :deal

  default_scope { order(:start_time) }

  scope :by_weeks, ->(date) { where('start_time >= ? AND start_time <= ?', date.beginning_of_month, date.end_of_month) }
  scope :by_days, ->(date) { where('start_time >= ? AND start_time <= ?', date.beginning_of_week, date.end_of_week) }
end
