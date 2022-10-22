# frozen_string_literal: true

module Types
  class RevenueInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :user_id, Integer, required: false
    argument :sales_target, Integer, 'fill this with the yearly target', required: false
    argument :client_annual_revenue, Integer, required: false
    argument :currency, String, required: false
    argument :notificaton_time, GraphQL::Types::ISO8601DateTime, 'pass any date with the correct time', required: false
    argument :year, GraphQL::Types::ISO8601DateTime, 'pass any date from the year', required: false
  end
end
