module Types
  class QuestionType < BaseObject
    field :id, ID, null: false
    field :content, String, null: true
    field :dream_account_id, ID, null: false
    field :answers, [AnswerType], null: true
  end
end
