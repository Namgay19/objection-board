module Attributes
  class TaskQuery < Types::BaseInputObject
    argument :date, GraphQL::Types::ISO8601DateTime, required: true
    argument :effect, String, required: false
  end
end
