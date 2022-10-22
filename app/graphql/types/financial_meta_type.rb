# frozen_string_literal: true

module Types
  class FinancialMetaType < Types::BaseObject
    field :daily_target, Integer, null: false
    field :weekly_target, Integer, null: false
    field :monthly_target, Integer, null: false
    field :yearly_target, Integer, null: false
    field :client_annual_revenue, Integer, null: false
  end
end
