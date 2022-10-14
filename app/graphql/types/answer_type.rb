module Types
  class AnswerType < BaseObject
    field :id, ID, null: false
    field :content, String, null: true
    field :tag, String, null: false
    field :question_id, ID, null: false
  end
end
