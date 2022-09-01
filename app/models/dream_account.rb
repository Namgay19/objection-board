class DreamAccount < ApplicationRecord
  belongs_to :user
  has_one :image, as: :imageable, dependent: :destroy
  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :image, allow_destroy: true
end
