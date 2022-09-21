module Attributes
  class ObjectionQuery < Types::BaseInputObject
    argument :sort_by, String, description: 'created_at, view_count', required: false
    argument :page, Integer, required: false
    argument :per_page, Integer, required: false
  end
end
