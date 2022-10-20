# frozen_string_literal: true

module Types
  class DailyDealInputType < Types::BaseInputObject
    argument :id, ID, required: true
    argument :amount, Integer, required: false
  end
end
