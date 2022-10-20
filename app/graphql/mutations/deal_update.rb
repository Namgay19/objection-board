# frozen_string_literal: true

module Mutations
  class DealUpdate < BaseMutation
    description "Updates a deal by id"

    type Types::DealType, null: false
    argument :attributes, Types::DealInputType, required: true

    def resolve(attributes:)
      deal = ::Deal.find(attributes.to_h[:id])
      raise GraphQL::ExecutionError.new "Error updating deal", extensions: deal.errors.to_hash unless deal.update(attributes.to_h)

      deal
    end
  end
end
