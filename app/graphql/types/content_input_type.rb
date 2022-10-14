# frozen_string_literal: true

module Types
  class ContentInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :book_id, Integer, required: false
    argument :title, String, required: false
    argument :description, String, required: false
    argument :image_ids, [ID], required: false
  end
end
