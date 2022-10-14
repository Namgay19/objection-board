# frozen_string_literal: true

module Mutations
  class VideoDelete < BaseMutation
    description "Deletes a video by ID"

    type Types::VideoType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      video = ::Video.find(id)
      raise GraphQL::ExecutionError.new "Error deleting video", extensions: video.errors.to_hash unless video.destroy

      video
    end
  end
end
