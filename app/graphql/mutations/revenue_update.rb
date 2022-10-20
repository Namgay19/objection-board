# frozen_string_literal: true

module Mutations
  class RevenueUpdate < BaseMutation
    description "Updates a revenue by id"

    type Types::RevenueType, null: false
    argument :attributes, Types::RevenueInputType, required: true

    def resolve(attributes:)
      revenue = ::Revenue.find(attributes.to_h[:id])
      raise GraphQL::ExecutionError.new "Error updating revenue", extensions: revenue.errors.to_hash unless revenue.update(attributes.to_h)

      revenue
    end
  end
end
