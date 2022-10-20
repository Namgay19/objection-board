# frozen_string_literal: true

module Mutations
  class DealDelete < BaseMutation
    description "Deletes a deal by ID"

    type Types::DealType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      deal = ::Deal.find(id)
      raise GraphQL::ExecutionError.new "Error deleting deal", extensions: deal.errors.to_hash unless deal.destroy

      deal
    end
  end
end
