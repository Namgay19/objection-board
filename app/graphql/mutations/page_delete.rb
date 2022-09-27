# frozen_string_literal: true

module Mutations
  class PageDelete < BaseMutation
    description "Deletes a page by ID"

    type Types::ContentType
    argument :id, ID, required: true

    def resolve(id:)
      page = ::Page.find(id)
      raise GraphQL::ExecutionError.new "Error deleting page", extensions: page.errors.to_hash unless page.destroy

      page
    end
  end
end
