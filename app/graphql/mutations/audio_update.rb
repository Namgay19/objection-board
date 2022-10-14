# frozen_string_literal: true

module Mutations
  class AudioUpdate < BaseMutation
    description "Updates a audio by id"

    class AudioUpdateAttributes < Types::BaseInputObject
      argument :id, ID, required: true
      argument :title, String, required: false
      argument :media, Types::FileType, required: false
    end

    type Types::AudioType, null: false
    argument :attributes, AudioUpdateAttributes, required: true

    def resolve(attributes:)
      audio = ::Audio.find(attributes.to_h[:id])
      raise GraphQL::ExecutionError.new "Error updating audio", extensions: audio.errors.to_hash unless audio.update(**attributes)

      audio
    end
  end
end
