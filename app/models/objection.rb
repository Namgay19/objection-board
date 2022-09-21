class Objection < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates_presence_of :title
end
