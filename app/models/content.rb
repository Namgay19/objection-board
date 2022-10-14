class Content < ApplicationRecord
  belongs_to :book

  has_many :images, as: :imageable, dependent: :destroy
end
