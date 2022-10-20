# frozen_string_literal: true

module Mutations
  class DailyDealUpdate < BaseMutation
    description "Updates a daily_deal by id"

    type Types::DailyDealType, null: false
    argument :attributes, Types::DailyDealInputType, required: true

    def resolve(attributes:)
      daily_deal = DailyDeal.find(attributes.to_h[:id])
      yearly_deal = daily_deal.deal
      prospective_yearly_deals = yearly_deal.deal_amount - daily_deal.amount
      raise GraphQL::ExecutionError.new "Error updating daily_revenue", extensions: daily_deal.errors.to_hash unless daily_deal.update(**attributes)

      yearly_deal.update_column(:deal_amount, prospective_yearly_deals + daily_deal.amount)
      daily_deal
    end
  end
end
