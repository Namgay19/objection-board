# frozen_string_literal: true

module Mutations
  class ChapterUpdate < BaseMutation
    description "Updates a chapter by id"

    type Types::ContentType
    argument :attributes, Types::ContentInputType, required: true

    def resolve(attributes:)
      chapter = Chapter.find(attributes.to_h[:id])
      chapter.update!(attributes.to_h)
      chapter
    end
  end
end
