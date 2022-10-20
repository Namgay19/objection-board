# frozen_string_literal: true

module Types
  class DealInfosType < Types::BaseObject
    field :deals, [DealDetailsType], null: true
    field :meta_info, FinancialMetaType, null: true
  end
end
