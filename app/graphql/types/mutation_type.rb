module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::UpdateUser
    field :create_task, mutation: Mutations::CreateTask
    field :update_task, mutation: Mutations::UpdateTask
    field :delete_task, mutation: Mutations::DeleteTask
  end
end
