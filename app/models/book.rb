class Book < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_one :image, as: :imageable, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :chapters, dependent: :destroy
  has_many :pages, dependent: :destroy

  validates_presence_of :title

  accepts_nested_attributes_for :image, allow_destroy: true
end
