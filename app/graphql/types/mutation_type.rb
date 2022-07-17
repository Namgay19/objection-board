module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::UpdateUser
    field :create_task, mutation: Mutations::CreateTask
  end
end
