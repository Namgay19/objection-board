# frozen_string_literal: true

module Types
  class DailyRevenueType < Types::BaseObject
    field :id, ID, null: false
    field :start_time, GraphQL::Types::ISO8601DateTime
    field :amount, Integer, null: false
    field :revenue_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
