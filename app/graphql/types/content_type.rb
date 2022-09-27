# frozen_string_literal: true

module Types
  class ContentType < Types::BaseObject
    field :id, ID, null: false
    field :book_id, Integer, null: false
    field :type, String
    field :title, String
    field :description, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
