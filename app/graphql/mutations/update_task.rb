module Mutations
  class UpdateTask < BaseMutation
    class UpdateAttributes < Types::BaseInputObject
      argument :id, ID, required: true
      argument :category, String, required: false
      argument :start_time, GraphQL::Types::ISO8601DateTime, required: false
      argument :end_time, GraphQL::Types::ISO8601DateTime, required: false
    end

    argument :attributes, UpdateAttributes, required: true
    type Types::TaskType

    def resolve(attributes:)
      params = attributes.to_h
      task = Task.find(params[:id])
      task.update!(params)
      task
    end
  end
end
