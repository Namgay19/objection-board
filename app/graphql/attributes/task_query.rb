module Attributes
  class TaskQuery < Types::BaseInputObject
    argument :date, GraphQL::Types::ISO8601DateTime, required: false
    argument :filter, String, required: false
    argument :effect, String, required: false
    argument :page, Integer, required: false
    argument :per_page, Integer, required: false
  end
end
