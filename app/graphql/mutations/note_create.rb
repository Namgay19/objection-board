# frozen_string_literal: true

module Mutations
  class NoteCreate < BaseMutation
    description "Creates a new note"
    
    type Types::ContentType, null: false
    argument :attributes, Types::ContentInputType, required: true

    def resolve(attributes:)
      note = ::Note.new(**attributes)
      raise GraphQL::ExecutionError.new "Error creating note", extensions: note.errors.to_hash unless note.save

      note
    end
  end
end
