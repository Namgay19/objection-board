# frozen_string_literal: true

module Types
  class RevenueType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :sales_target, Integer
    field :client_annual_revenue, Integer
    field :sales_amount, Integer
    field :currency, String
    field :notification_time, GraphQL::Types::ISO8601DateTime
    field :year, GraphQL::Types::ISO8601DateTime
  end
end
