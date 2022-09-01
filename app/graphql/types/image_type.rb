module Types
  class ImageType < BaseObject
    field :id, ID, null: false
    field :url, String, null: false

    def url
      Rails.application.routes.url_helpers.rails_blob_path(object.avatar, only_path: true)
    end
  end
end
