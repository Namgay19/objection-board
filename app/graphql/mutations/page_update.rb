# frozen_string_literal: true

module Mutations
  class PageUpdate < BaseMutation
    description "Updates a page by id"

    type Types::ContentType
    argument :attributes, Types::ContentInputType, required: true

    def resolve(attributes:)
      page = Page.find(attributes.to_h[:id])
      page.update!(attributes.to_h)
      page
    end
  end
end
