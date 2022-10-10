# frozen_string_literal: true

module Types
  class StoryType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :description, String
    field :user_id, Integer, null: false
    field :user, UserType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
