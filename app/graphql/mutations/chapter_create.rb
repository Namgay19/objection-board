# frozen_string_literal: true

module Mutations
  class ChapterCreate < BaseMutation
    description "Creates a new chapter"
    
    type Types::ContentType, null: false
    argument :attributes, Types::ContentInputType, required: true

    def resolve(attributes:)
      params = attributes.to_h.except(:image_ids)
      image_ids = attributes.to_h[:image_ids]
      chapter = ::Chapter.new(params)
      raise GraphQL::ExecutionError.new "Error creating chapter", extensions: chapter.errors.to_hash unless chapter.save

      associate_images(image_ids, chapter)
      chapter
    end
  end
end
