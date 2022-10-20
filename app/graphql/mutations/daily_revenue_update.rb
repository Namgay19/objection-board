# frozen_string_literal: true

module Mutations
  class DailyRevenueUpdate < BaseMutation
    description "Updates a daily_revenue by id"

    type Types::DailyRevenueType, null: false

    argument :attributes, Types::DailyRevenueInputType, required: true

    def resolve(attributes:)
      daily_revenue = DailyRevenue.find(attributes.to_h[:id])
      yearly_revenue = daily_revenue.revenue
      prospective_yearly_sales = yearly_revenue.sales_amount - daily_revenue.amount
      raise GraphQL::ExecutionError.new "Error updating daily_revenue", extensions: daily_revenue.errors.to_hash unless daily_revenue.update(**attributes)

      yearly_revenue.update_column(:sales_amount, prospective_yearly_sales + daily_revenue.amount)
      daily_revenue
    end
  end
end
