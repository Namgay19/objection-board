# frozen_string_literal: true

module Types
  class DailyDealType < Types::BaseObject
    field :id, ID, null: false
    field :start_time, GraphQL::Types::ISO8601DateTime
    field :amount, Integer, null: false
    field :deal_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
