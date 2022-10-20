# frozen_string_literal: true

module Types
  class RevenueInfosType < Types::BaseObject
    field :revenues, [RevenueDetailsType], null: true
    field :meta_info, FinancialMetaType, null: true
  end
end
