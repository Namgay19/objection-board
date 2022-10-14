# frozen_string_literal: true

module Mutations
  class StoryDelete < BaseMutation
    description "Deletes a story by ID"

    type Types::StoryType

    argument :id, ID, required: true

    def resolve(id:)
      story = ::Story.find(id)
      raise GraphQL::ExecutionError.new "Error deleting story", extensions: story.errors.to_hash unless story.destroy

      story
    end
  end
end
