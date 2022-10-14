module Mutations
  class DeleteTask < BaseMutation
    argument :id, ID, required: true

    type Types::TaskType

    def resolve(id:)
      task = Task.find(id)
      task.destroy!
    end
  end
end
