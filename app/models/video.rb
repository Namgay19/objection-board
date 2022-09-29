class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :media, dependent: :destroy

  validates_presence_of :title

  validates :media,
            file_size: { less_than: 10.megabytes },
            file_content_type: { allow: %w[video/mp4] }
end
