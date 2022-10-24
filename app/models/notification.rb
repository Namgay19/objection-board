class Notification < ApplicationRecord
  belongs_to :user

  default_scope { order(created_at: :desc) }

  enum category: { revenue_reminder: 0 }
end
