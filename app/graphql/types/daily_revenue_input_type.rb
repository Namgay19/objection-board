# frozen_string_literal: true

module Types
  class DailyRevenueInputType < Types::BaseInputObject
    argument :id, ID, required: true
    argument :amount, Integer, required: false
  end
end
