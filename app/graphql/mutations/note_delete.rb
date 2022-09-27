# frozen_string_literal: true

module Mutations
  class NoteDelete < BaseMutation
    description "Deletes a note by ID"

    type Types::ContentType
    argument :id, ID, required: true

    def resolve(id:)
      note = ::Note.find(id)
      raise GraphQL::ExecutionError.new "Error deleting note", extensions: note.errors.to_hash unless note.destroy

      note
    end
  end
end
