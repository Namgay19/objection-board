# frozen_string_literal: true

module Mutations
  class StoryCreate < BaseMutation
    description "Creates a new story"

    class StoryCreateAttributes < Types::BaseInputObject
      argument :title, String, required: true
      argument :description, String, required: true
      argument :image_ids, [ID], 'ids from images in rich text', required: false
    end

    type Types::StoryType
    argument :attributes, StoryCreateAttributes, required: true

    def resolve(attributes:)
      params = attributes.to_h.except(:image_ids)
      image_ids = attributes.to_h[:image_ids]
      story = ::Story.new(params)
      story.user = current_user
      raise GraphQL::ExecutionError.new "Error creating story", extensions: story.errors.to_hash unless story.save

      associate_images(image_ids, story)
      story
    end
  end
end
