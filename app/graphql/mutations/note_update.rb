# frozen_string_literal: true

module Mutations
  class NoteUpdate < BaseMutation
    description "Updates a note by id"

    type Types::ContentType
    argument :attributes, Types::ContentInputType, required: true

    def resolve(attributes:)
      note = Note.find(attributes.to_h[:id])
      note.update!(attributes.to_h)
      note
    end
  end
end
