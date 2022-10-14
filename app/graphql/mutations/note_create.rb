# frozen_string_literal: true

module Mutations
  class NoteCreate < BaseMutation
    description "Creates a new note"
    
    type Types::ContentType, null: false
    argument :attributes, Types::ContentInputType, required: true

    def resolve(attributes:)
      params = attributes.to_h.except(:image_ids)
      image_ids = attributes.to_h[:image_ids]
      note = ::Note.new(params)
      raise GraphQL::ExecutionError.new "Error creating note", extensions: note.errors.to_hash unless note.save

      associate_images(image_ids, note)
      note
    end
  end
end
