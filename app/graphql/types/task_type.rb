module Types
  class TaskType < BaseObject
    field :id, ID, null: false
    field :category, String, null: false
    field :start_time, GraphQL::Types::ISO8601DateTime, null: true
    field :end_time, GraphQL::Types::ISO8601DateTime, null: true
    field :starting_time, String, null: true
    field :ending_time, String, null: true
    field :duration, String, null: true
    field :extra_time, String, null: true
    field :duration_per_day, String, null: true
    field :duration_per_week, String, null: true
    field :duration_per_month, String, null: true
    field :duration_per_year, String, null: true
    field :total_time_by_day, String, null: true
    field :total_time_by_week, String, null: true
    field :total_time_by_month, String, null: true
    field :total_time_by_year, String, null: true
  end
end
