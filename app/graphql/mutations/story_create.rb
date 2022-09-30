# frozen_string_literal: true

module Mutations
  class StoryCreate < BaseMutation
    description "Creates a new story"

    class StoryCreateAttributes < Types::BaseInputObject
      argument :title, String, required: true
      argument :description, String, required: true
    end

    type Types::StoryType
    argument :attributes, StoryCreateAttributes, required: true

    def resolve(attributes:)
      story = ::Story.new(**attributes)
      raise GraphQL::ExecutionError.new "Error creating story", extensions: story.errors.to_hash unless story.save

      story
    end
  end
end
