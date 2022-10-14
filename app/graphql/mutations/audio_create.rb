# frozen_string_literal: true

module Mutations
  class AudioCreate < BaseMutation
    description "Creates a new audio"

    class AudioCreateAttributes < Types::BaseInputObject
      argument :title, String, required: false
      argument :media, Types::FileType, required: true
    end

    type Types::AudioType, null: false
    argument :attributes, AudioCreateAttributes, required: true

    def resolve(attributes:)
      audio = ::Audio.new(**attributes)
      audio.user = current_user
      raise GraphQL::ExecutionError.new "Error creating audio", extensions: audio.errors.to_hash unless audio.save

      audio
    end
  end
end
