module Attributes
  class RevenueQuery < Types::BaseInputObject
    argument :date, GraphQL::Types::ISO8601DateTime, 'pass a date object here', required: false
    argument :filter_type, String, %w[year, month, week, day], required: false
  end
end
