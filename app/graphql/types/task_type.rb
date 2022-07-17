module Types
  class TaskType < BaseObject
    field :id, ID, null: false
    field :category, String, null: false
    field :start_time, GraphQL::Types::ISO8601DateTime, null: true
    field :end_time, GraphQL::Types::ISO8601DateTime, null: true
    field :starting_time, String, null: true
    field :ending_time, String, null: true
    field :duration, String, null: true
  end
end
