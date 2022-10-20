# frozen_string_literal: true

module Mutations
  class RevenueDelete < BaseMutation
    description "Deletes a revenue by ID"

    type Types::RevenueType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      revenue = ::Revenue.find(id)
      raise GraphQL::ExecutionError.new "Error deleting revenue", extensions: revenue.errors.to_hash unless revenue.destroy

      revenue
    end
  end
end
