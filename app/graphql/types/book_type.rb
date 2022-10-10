# frozen_string_literal: true

module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :author, String
    field :description, String
    field :image, ImageType
    field :creator_id, ID, null: false
    field :creator, UserType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false

    field :pages, [ContentType], null: false
    field :chapters, [ContentType], null: false
    field :notes, [ContentType], null: false
  end
end
