module Attributes
  class YearlyQuery < Types::BaseInputObject
    argument :year, GraphQL::Types::ISO8601DateTime, 'pass any date from the selected year', required: false
  end
end
