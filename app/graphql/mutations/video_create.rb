# frozen_string_literal: true

module Mutations
  class VideoCreate < BaseMutation
    description "Creates a new video"

    class VideoCreateAttributes < Types::BaseInputObject
      argument :title, String, required: false
      argument :description, String, required: false
      argument :media, Types::FileType, required: true
    end

    type Types::VideoType, null: false
    argument :attributes, VideoCreateAttributes, required: true

    def resolve(attributes:)
      video = ::Video.new(**attributes)
      video.user = current_user
      raise GraphQL::ExecutionError.new "Error creating vidio", extensions: video.errors.to_hash unless video.save

      video
    end
  end
end
