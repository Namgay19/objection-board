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

    field :book_create, mutation: Mutations::BookCreate
    field :book_delete, mutation: Mutations::BookDelete
    field :book_update, mutation: Mutations::BookUpdate

    field :page_create, mutation: Mutations::PageCreate
    field :page_update, mutation: Mutations::PageUpdate
    field :page_delete, mutation: Mutations::PageDelete

    field :note_create, mutation: Mutations::NoteCreate
    field :note_update, mutation: Mutations::NoteUpdate
    field :note_delete, mutation: Mutations::NoteDelete

    field :chapter_create, mutation: Mutations::ChapterCreate
    field :chapter_update, mutation: Mutations::ChapterUpdate
    field :chapter_delete, mutation: Mutations::ChapterDelete
  end
end
