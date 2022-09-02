module Attributes
  class AnswerAttributes < Types::BaseInputObject
    argument :id, ID, required: false
    argument :content, String, required: false
    argument :tag, String, description: %w[value goal cause hero inspiration], required: false
    argument :_destroy, Boolean, required: false
  end
end
