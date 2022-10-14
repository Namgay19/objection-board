# frozen_string_literal: true

module Types
  class VideoType < Types::BaseObject
    field :id, ID, null: false
    field :user, UserType, null: false
    field :user_id, ID, null: false
    field :title, String
    field :description, String
    field :media_url, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def media_url
      Rails.application.routes.url_helpers.rails_blob_path(object.media, only_path: true)
    end
  end
end
