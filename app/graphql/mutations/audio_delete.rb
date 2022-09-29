# frozen_string_literal: true

module Mutations
  class AudioDelete < BaseMutation
    description "Deletes a audio by ID"

    type Types::AudioType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      audio = ::Audio.find(id)
      raise GraphQL::ExecutionError.new "Error deleting audio", extensions: audio.errors.to_hash unless audio.destroy

      audio
    end
  end
end
