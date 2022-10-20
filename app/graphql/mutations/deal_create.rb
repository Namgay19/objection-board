# frozen_string_literal: true

module Mutations
  class DealCreate < BaseMutation
    description "Creates a new deal"

    type Types::DealType, null: false
    argument :attributes, Types::DealInputType, required: true

    def resolve(attributes:)
      deal = ::Deal.new(**attributes)
      deal.user = current_user
      raise GraphQL::ExecutionError.new "Error creating deal", extensions: deal.errors.to_hash unless deal.save

      DailyDealJob.perform_async(deal.id)
      deal
    end
  end
end
