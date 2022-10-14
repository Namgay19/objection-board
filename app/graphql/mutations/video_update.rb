# frozen_string_literal: true

module Mutations
  class VideoUpdate < BaseMutation
    description "Updates a video by id"

    class VideoUpdateAttributes < Types::BaseInputObject
      argument :id, ID, required: true
      argument :title, String, required: false
      argument :description, String, required: false
      argument :media, Types::FileType, required: false
    end

    type Types::VideoType, null: false
    argument :attributes, VideoUpdateAttributes, required: true

    def resolve(attributes:)
      video = ::Video.find(attributes.to_h[:id])
      raise GraphQL::ExecutionError.new "Error updating video", extensions: video.errors.to_hash unless video.update(**attributes)

      video
    end
  end
end
