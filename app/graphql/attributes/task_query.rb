module Attributes
  class TaskQuery < Types::BaseInputObject
    argument :date, GraphQL::Types::ISO8601DateTime, required: true
    argument :filter, String, required: false
    argument :effect, String, required: false
  end
end
