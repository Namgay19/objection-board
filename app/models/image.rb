class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true

  has_one_attached :avatar, dependent: :destroy

  VALID_CONTENT_TYPES = %w[image/jpeg image/jpg image/png image/tiff image/gif].freeze

  validates :avatar,
            file_size: { less_than: 2.megabytes },
            file_content_type: { allow: VALID_CONTENT_TYPES }

  before_destroy :destroy_avatar

  def destroy_avatar
    avatar.purge if avatar.present?
  end
end
