class Story < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable, dependent: :destroy

  validates_presence_of :title
end
