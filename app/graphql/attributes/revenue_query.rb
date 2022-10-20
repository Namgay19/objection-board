module Attributes
  class RevenueQuery < Types::BaseInputObject
    argument :date, GraphQL::Types::ISO8601DateTime, required: false
    argument :filter_type, String, required: false
    argument :page, Integer, required: false
    argument :per_page, Integer, required: false
  end
end
