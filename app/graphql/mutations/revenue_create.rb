# frozen_string_literal: true

module Mutations
  class RevenueCreate < BaseMutation
    description "Creates a new revenue target for year"

    type Types::RevenueType, null: false
    argument :attributes, Types::RevenueInputType, required: true

    def resolve(attributes:)
      revenue = ::Revenue.new(**attributes)
      revenue.user = current_user
      raise GraphQL::ExecutionError.new "Error creating revenue", extensions: revenue.errors.to_hash unless revenue.save

      DailyRevenueJob.perform_async(revenue.id)
      revenue
    end
  end
end
