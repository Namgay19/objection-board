# frozen_string_literal: true

module Types
  class FinancialMetaType < Types::BaseObject
    field :daily_target, Integer, null: true
    field :weekly_target, Integer, null: true
    field :monthly_target, Integer, null: true
    field :yearly_target, Integer, null: true
    field :client_annual_revenue, Integer, null: true
  end
end
