module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::UpdateUser
    field :create_task, mutation: Mutations::CreateTask
    field :update_task, mutation: Mutations::UpdateTask
    field :delete_task, mutation: Mutations::DeleteTask
    field :create_dream_account, mutation: Mutations::CreateDreamAccount
    field :update_dream_account, mutation: Mutations::UpdateDreamAccount
    field :delete_dream_account, mutation: Mutations::DeleteDreamAccount
  end
end
