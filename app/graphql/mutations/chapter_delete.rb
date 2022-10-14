# frozen_string_literal: true

module Mutations
  class ChapterDelete < BaseMutation
    description "Deletes a chapter by ID"

    type Types::ContentType
    argument :id, ID, required: true

    def resolve(id:)
      chapter = ::Chapter.find(id)
      raise GraphQL::ExecutionError.new "Error deleting chapter", extensions: chapter.errors.to_hash unless chapter.destroy

      chapter
    end
  end
end
