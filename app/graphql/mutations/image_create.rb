# frozen_string_literal: true

module Mutations
  class ImageCreate < BaseMutation
    description "Creates a new image"

    type Types::ImageType, null: false
    argument :attributes, Attributes::ImageAttributes, required: true

    def resolve(attributes:)
      image = ::Image.new(**attributes)
      raise GraphQL::ExecutionError.new "Error creating image", extensions: image.errors.to_hash unless image.save

      DeleteImageJob.perform_in(5.minutes, image.id)
      image
    end
  end
end
