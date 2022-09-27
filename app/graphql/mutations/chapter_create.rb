# frozen_string_literal: true

module Mutations
  class ChapterCreate < BaseMutation
    description "Creates a new chapter"
    
    type Types::ContentType, null: false
    argument :attributes, Types::ContentInputType, required: true

    def resolve(attributes:)
      chapter = ::Chapter.new(**attributes)
      raise GraphQL::ExecutionError.new "Error creating chapter", extensions: chapter.errors.to_hash unless chapter.save

      chapter
    end
  end
end
