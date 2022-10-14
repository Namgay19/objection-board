# frozen_string_literal: true

module Mutations
  class PageCreate < BaseMutation
    description "Creates a new page"

    type Types::ContentType, null: false
    argument :attributes, Types::ContentInputType, required: true

    def resolve(attributes:)
      params = attributes.to_h.except(:image_ids)
      image_ids = attributes.to_h[:image_ids]
      page = ::Page.new(params)
      raise GraphQL::ExecutionError.new "Error creating note", extensions: page.errors.to_hash unless page.save

      associate_images(image_ids, page)
      page
    end
  end
end
