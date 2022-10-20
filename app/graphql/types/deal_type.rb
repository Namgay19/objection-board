# frozen_string_literal: true

module Types
  class DealType < Types::BaseObject
    field :id, ID, null: false
    field :deal_target, Integer
    field :deal_amount, Integer
    field :year, GraphQL::Types::ISO8601DateTime
    field :notification_time, GraphQL::Types::ISO8601DateTime, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
