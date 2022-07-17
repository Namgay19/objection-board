module Mutations
  class CreateTask < BaseMutation
    class CreateAttributes < Types::BaseInputObject
      argument :category, String, required: true
      argument :start_time, GraphQL::Types::ISO8601DateTime, required: true
      argument :end_time, GraphQL::Types::ISO8601DateTime, required: true
    end

    argument :attributes, CreateAttributes, required: true
    type Types::TaskType

    def resolve(attributes:)
      task = Task.new(attributes.to_h)
      task.user = current_user
      task.save!
      task
    end
  end
end
