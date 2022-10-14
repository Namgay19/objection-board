# frozen_string_literal: true

module Mutations
  class StoryUpdate < BaseMutation
    description "Updates a story by id"

    class StoryUpdateAttributes < Types::BaseInputObject
      argument :id, ID, required: true
      argument :title, String, required: false
      argument :description, String, required: false
    end

    type Types::StoryType
    argument :attributes, StoryUpdateAttributes, required: true

    def resolve(attributes:)
      story = ::Story.find(attributes.to_h[:id])
      raise GraphQL::ExecutionError.new "Error updating story", extensions: story.errors.to_hash unless story.update(**attributes)

      story
    end
  end
end
