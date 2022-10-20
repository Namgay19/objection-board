# frozen_string_literal: true

module Types
  class DealInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :deal_target, Integer, required: false
    argument :year, GraphQL::Types::ISO8601DateTime, required: false
    argument :notification_time, GraphQL::Types::ISO8601DateTime, required: false
  end
end
