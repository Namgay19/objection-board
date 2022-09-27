# frozen_string_literal: true

module Mutations
  class PageCreate < BaseMutation
    description "Creates a new page"

    type Types::ContentType, null: false
    argument :attributes, Types::ContentInputType, required: true

    def resolve(attributes:)
      page = ::Page.new(**attributes)
      raise GraphQL::ExecutionError.new "Error creating page", extensions: page.errors.to_hash unless page.save

      page
    end
  end
end
