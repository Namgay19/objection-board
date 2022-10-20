# frozen_string_literal: true

module Types
  class RevenueDetailsType < Types::BaseObject
    field :id, ID, null: true
    field :identifier, String, null: false
    field :total_revenue, Integer, null: false
    field :target_comparison, Integer, null: false
    field :target_to_achieve, Integer, null: false
    field :on_target, Integer, "this is the percentage comparison value", null: false
    field :currency, String, null: false
  end
end
