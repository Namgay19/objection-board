module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::UpdateUser
    field :create_task, mutation: Mutations::CreateTask
    field :update_task, mutation: Mutations::UpdateTask
    field :delete_task, mutation: Mutations::DeleteTask

    field :create_dream_account, mutation: Mutations::CreateDreamAccount
    field :update_dream_account, mutation: Mutations::UpdateDreamAccount
    field :delete_dream_account, mutation: Mutations::DeleteDreamAccount

    field :create_question, mutation: Mutations::CreateQuestion
    field :update_question, mutation: Mutations::UpdateQuestion
    field :delete_question, mutation: Mutations::DeleteQuestion

    field :create_objection, mutation: Mutations::CreateObjection
    field :update_objection, mutation: Mutations::UpdateObjection
    field :delete_objection, mutation: Mutations::DeleteObjection
  end
end
