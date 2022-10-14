module Attributes
  class BookQuery < Types::BaseInputObject
    argument :sort_by, String, description: 'created_at, viewed_at', required: false
    argument :page, Integer, required: false
    argument :per_page, Integer, required: false
  end
end
